/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package igra;

import com.sun.xml.rpc.processor.modeler.j2ee.xml.string;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author Imana
 */
public class Igra {
    
    public StringBuilder trenutni_pokusaj;
    public static  FileReader fileReader;
    public static BufferedReader buffFileReader;
    public static ArrayList<String> recnik = new ArrayList<String>();
    public  ArrayList<Character> prethodniPokusaji = new ArrayList<>();
    public static String trazenaRec;
   
    public int trenutni = 0;

  
            public StringBuilder initializeTrenutniPokusaj() {

                StringBuilder current = new StringBuilder();
                for(int i = 0; i < trazenaRec.length()*2; i++) {
                    if(i%2 == 0) {
                        current.append("_");

                    } else {
                        current.append(" ");
                    }
                }

                return current;

            }


            public String getCurrentGuess() {
                 return  trenutni_pokusaj.toString();
            }



            public boolean pobeda() {
                String guess = getGuess();
                return guess.equals(trazenaRec);
            }





            public String getGuess() {
                String guess = trenutni_pokusaj.toString();
                return guess.replace(" ", "");
            }


            public boolean vecPogodjeno(char guess) {
                return prethodniPokusaji.contains(guess);
            }
            
           

            public boolean pogodak(char guess) {
              boolean isItAGoodGuess = false;
              prethodniPokusaji.add(guess);
              for (int i = 0; i < trazenaRec.length(); i++) {
                  if (trazenaRec.charAt(i) == guess) {
                      trenutni_pokusaj.setCharAt(i * 2, guess);
                      isItAGoodGuess = true;
                  }
              }

              if (!isItAGoodGuess) {
                  trenutni++;
              }

              return isItAGoodGuess;
          }

      
              
               

           public static void initializeStreams() throws IOException {

           try {

               File inFile = new File("C:/Users/Imana/Desktop/recnik.txt");
                fileReader = new FileReader(inFile);
                buffFileReader = new BufferedReader(fileReader);

               String currentLine = buffFileReader.readLine();

                   while(currentLine != null) {
                         recnik.add(currentLine);
                         currentLine = buffFileReader.readLine();
                   } 

                   buffFileReader.close();
                   fileReader.close();

           } catch (IOException e) {
               System.out.println(e);
           }
       }
    
    
            public static String izaberiRec() {

               Random rand = new Random();
               int wordId = Math.abs(rand.nextInt()) % recnik.size();

               return recnik.get(wordId);
           }

    

    



    
}
