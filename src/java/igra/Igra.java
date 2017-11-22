/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package igra;

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
    
    static ArrayList<String> recnik = new ArrayList<>();
    private static FileReader fileReader;
    
    private static BufferedReader buffFileReader;
    public static String trazenaRec;
    
    
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
