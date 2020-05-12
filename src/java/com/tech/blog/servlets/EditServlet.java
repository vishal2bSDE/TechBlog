
package com.tech.blog.servlets;

import com.tech.blog.dao.userDAO;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.user;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class EditServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");            
            out.println("</head>");
            out.println("<body>");
           
            String userEmail=request.getParameter("user_email");
            String userPassword=request.getParameter("user_password");
            String userAbout=request.getParameter("user_about");
            Part part=request.getPart("image");
//            gives image name
            String imageName=part.getSubmittedFileName();
            
//            get the current user session to update the data
            HttpSession s=request.getSession();
            user user=(user)s.getAttribute("currentUser");//for more info go to login servlet
            user.setEmail(userEmail);
            user.setAbout(userAbout);
            user.setPassword(userPassword);
            String oldFile=user.getProfile();
            user.setProfile(imageName);
            
//            create connection
            userDAO dao=new userDAO(ConnectionProvider.getConnection());
            
            boolean ans=dao.updateUser(user);
            if(ans){                
//                getRealPath will give the path till web_pages, File.seperator will give "/". we could have used "/" directly
//                  but sometime it goes wrong so to keep 100%
                String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();
                String pathOldFIle=request.getRealPath("/")+"pics"+File.separator+oldFile;
                if(!oldFile.equals("default.png"))
                    Helper.deleteFile(pathOldFIle);//delete the file with same name if present
                if(Helper.saveFile(part.getInputStream(), path)){//part containf image data
                    //out.println("updated to DB");
                    Message msg=new Message("profile updated successfully ......","success","alert-success");
                    s.setAttribute("msg", msg);

                }         
                else{
                    Message msg=new Message("something went wrong ......","error","alert-danger");
                    s.setAttribute("msg", msg);

                }
            }else{
                //out.println("not updated..");
                Message msg=new Message("something went wrong ......","error","alert-danger");
                s.setAttribute("msg", msg);
                
            }
            response.sendRedirect("profile.jsp");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
