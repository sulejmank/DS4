<%-- 
    Document   : index
    Created on : Nov 21, 2017, 7:11:20 PM
    Author     : Sulejman
--%>

<%@page import="javax.swing.JOptionPane"%>
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
            String trenutni_pokusaj = request.getParameter("guess");
          
            
            int brPogresnih = igra.trenutni;
            
             if(trenutni_pokusaj == null){  
                brPogresnih = 0;
                igra.trenutni = 0;
                igra.initializeStreams();
                String rec = igra.izaberiRec();
                
                igra.trazenaRec = rec;
                igra.trenutni_pokusaj = igra.initializeTrenutniPokusaj();
                          
            }
            
                        
        %>
     
    <body>
	<h3 style = "text-align: center;">Igra Vesala</h3>
	<hr />
      


	<div class='vesanje jumbotron'>
           <img src="<%=brPogresnih%>.png">                                  
        </div>
   
           <% if(trenutni_pokusaj != null){
                char pokusaj = trenutni_pokusaj.charAt(0);
           
                if(igra.pogodak(pokusaj)) {
                    if(igra.pobeda()){
                        
                        %><script> alert("Pobedili ste!"); </script><%
                        %> <h1 style="text-align: center;"><%=igra.getCurrentGuess()%></h1> <%
                            
                    } else {

                        %> <h1 style="text-align: center;"><%=igra.getCurrentGuess()%></h1> <%
                     }
                    } else {
                           if(igra.trenutni > 7) {
                                %><script> alert("Izgubili ste!"); </script><%
                                %> <h1 style="text-align: center;"> <%=igra.trazenaRec%> </h1> <%
                            } else {
                                %> <h1 style="text-align: center;"> <%=igra.getCurrentGuess()%> </h1> <%
                        }
                    }                                       
                                        
            } else {
                    %> <h1 style="text-align: center;"> <%=igra.getCurrentGuess()%> </h1> <%
                }
               
        %>
           
		<div class="tastatura ">
                                         
                    <% 
                        char[] a = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N',
                                    'O','P','Q','R','S','T','U','V','W','X','Y','Z'};
                        
                            for(int j = 0; j<a.length;j++){
                                                           
                    %>     
                    
                    <span><form action="#" method="post">
                    <input type='hidden' value="<%=a[j]%>" name='guess'  />
                    <input type="submit" value="<%=a[j]%>" name="pokusaj" class="btn btn-default" /> 
                    </form></span>
                    
                    <% } %>
                   

			<br />	<br/>

			<form action="Servlet" method="post">
				<input type="submit" value="Nova Igra" name="restart" class="btn btn-info btn-lg" />
			</form>
                     
		</div>
                                  
	</body>

</html>
