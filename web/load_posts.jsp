<%@page import="com.tech.blog.entities.user"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>


<div class="row">
<% 
    PostDao d=new PostDao(ConnectionProvider.getConnection());
    user user=(user)session.getAttribute("currentUser");
    int cid=Integer.parseInt(request.getParameter("cid"));
    List<Post> posts=null;
    if(cid==0)
        posts=d.getAllPosts();
    else
        posts=d.getPostByCatId(cid);
    if(posts.size()==0)
    {
        out.println("<h3 class='display-3 text-center'>no post in this catgory</h3>");
        return;
    }
    for(Post p:posts){
        %>
        <div class="col-md-6 mt-2">
            <div class="card">
                <img src="blog_pics/<%= p.getpPic() %>" class="card-img-top" alt="...">
                <div class="card-body">
                    <b><%= p.getpTitle() %></b>
                    <p><%= p.getpContent() %></p>
                   <!-- pre tag is for coding lines -->
                   <pre> <%= p.getpCode()%></pre>
                </div>
                <div class="card-footer text-center primary-background">
                    <%
                                LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
                                
                    %>
                    <a href="#!" onclick="doLike(<%=p.getpId()%>,<%=user.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i>
                        <span class="like-counter" id="pid<%=p.getpId()%>"> <%= ld.conuntLikeOnPost(p.getpId()) %></span></a>
                    <!--here we are using url rewriting here-->
                    <a href="show_blog_page.jsp?post_id=<%=p.getpId()%>" class="btn btn-outline-light btn-sm">Read more..</a>                    
                    <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span> 12</span></a>
                </div>
            </div>
        </div>   
        
        <%
    }
%>
</div>