/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import igra.Igra;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Servlet extends HttpServlet {



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
               Igra igra = new Igra();
             igra.initializeStreams();
             String rec = igra.izaberiRec();
             String address = "index.jsp";
             igra.trenutni = 0;
             igra.trazenaRec = rec;
             
             response.sendRedirect(address);
           
             
             
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
