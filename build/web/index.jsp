<%-- 
    Document   : index
    Created on : Nov 21, 2017, 7:11:20 PM
    Author     : Sulejman
--%>

<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="com.sun.xml.rpc.processor.modeler.j2ee.xml.string"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>

		<title>Igra Vesala</title>
		<link type="text/css" rel="stylesheet" href="main.css">

	</head>
        
        <jsp:useBean id="igra" class="igra.Igra" scope="session"/>
        <jsp:setProperty name="igra" property="*"/>
        
        <%
             igra.initializeStreams();
             String trazenaRec = igra.izaberiRec();
             String trenutniPokusaj = request.getParameter("guess");
             
             int brPogresnih = 0;  
              
        %>
     
    <body>
	<h3 style = "text-align: center;">Igra Vesala</h3>
	<hr />
        
	<div class='vesanje jumbotron'>
           <img src="<%=brPogresnih%>.png">                                  
        </div>

		<div class="tastatura ">
                                         
                    <% 
                        char[] a = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N',
                                    'O','P','Q','R','S','T','U','V','W','X','Y','Z'};
                        
                            for(int i = 0; i<a.length;i++){
                                                           
                    %>     
                    
                    <span><form action="#" method="post">
                    <input type='hidden' value="<%=a[i]%>" name='guess'  />
                    <input type="submit" value="<%=a[i]%>" name="pokusaj" class="btn btn-info" /> 
                    </form></span>
                    
                    <% } %>
                   

			<br />	<br/>

			<form action="novaRec" method="post">
				<input type="submit" value=" Nova Reč " name="restart" class="btn btn-info btn-lg" />
			</form>

		</div>
                                  
	</body>

</html>
