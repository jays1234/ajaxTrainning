<%-- 
    Document   : index
    Created on : Jun 11, 2015, 1:30:32 AM
    Author     : phirayu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script>
        var req;
        
        ajax = function(){
               
               if (window.XMLHttpRequest) {
                   req = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    isIE = true;
                    req = new ActiveXObject("Microsoft.XMLHTTP");
                }
                req.open("GET","/ajax/Servlet?input="+document.getElementById("name").value,true);
                req.onreadystatechange = process;
                req.send(null); 
            }
            process = function(){
                if(req.readyState == 4 && req.status == 200){
                    var jsonObject = eval('('+req.responseText+")");
                    console.log(jsonObject.topics.name);
                    for(var i = 0;i<jsonObject.topics.tutor.length;i++){
                        console.log(jsonObject.topics.tutor[i].firstname+' '+jsonObject.topics.tutor[i].lastname);
                        
                    }
                }
            }
         </script>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
           <input id="name"/>
           <button value="click me" id="button" onclick="ajax()">Click me</button>
    </body>
</html>
