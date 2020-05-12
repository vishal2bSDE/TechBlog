//$(document).ready(function(){
//                alert("document loaded js")
//            })
//
function doLike(pid,uid){
    console.log(pid+","+uid);
    const d={
        uid: uid,
        pid: pid,
        operation: 'like'
    }
    
    $.ajax({
       url: 'LikeServlet' ,
       data: d ,
       success: function (data, textStatus, jqXHR) {
            console.log(data);
            if(data.trim()=='true'){
                let c=$("#pid"+pid).html();
                c++;
               // $(".like-counter").html(c);
                $("#pid"+pid).text(c);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
        }
    });
}