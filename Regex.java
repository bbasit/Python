/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package regex;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class Regex {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        String mail =("([a-zA-Z0-9_.]+@[a-zA-Z0-9]+.[a-zA-Z0-9]{2,3}[.]?[a-zA-Z]+)");
       //org String url =("((?:https?\\:\\/\\/|www\\.)(?:[-a-z0-9]+\\.)*[-a-z0-9]+.*)");
        String url =("((https?://?|www.|ftp://)(\\S)+)");
       // String url =("(https?://?|www.|ftp://)[a-zA-Z0-9./#@!$%&-=_[*][?]]+");
        String mobile =("([1-9][0-9]{3}-[0-9]{3}-[0-9]{4})|([+]?[0-9]{2}[-]?[0-9]{3}[-]?[0-9]{7})|([0]?[0-9]{3}[-]?[0-9]{6})");
        String dateP1 = ("([0-2]?[1-9]|[1-3][0]|31)[.|/|-]([0]?[1-9]|1[0-2])[.|/|-]([1-2][0-9][0-9][0-9]|[1-9][0-9])");
        String dateP2 = ("([1-2][0-9][0-9][0-9])[.|/|-]([0-2]?[1-9]|[1-3][0]|31)[.|/|-]([0]?[1-9]|1[0-2])");
        String dateP3 = ("([0]?[1-9]|1[0-2])[.|/|-]([0-2]?[1-9]|[1-3][0]|31)[.|/|-]([1-2][0-9][0-9][0-9]|[1-9][0-9])");
        String dateP4 = ("((may|jun|july|aug|sep|oct|nov|dec|jan|feb|march|april))[.|/|[-]|\\s?]([0-2]?[1-9]|[1-3][0]|31)[.|/|[-]|\\s?]([1-2][0-9][0-9][0-9]|[1-9][0-9])");
        String dateP5 = ("([1-2][0-9][0-9][0-9]|[1-9][0-9])[.|/|[-]|\\s?]((may|jun|july|aug|sep|oct|nov|dec|jan|feb|march|april))[.|/|[-]|\\s?]([0-2]?[1-9]|[1-3][0]|31)");
        String dateP6 = ("([0-2]?[1-9]|[1-3][0]|31)[.|/|[-]|\\s?]([1-2][0-9][0-9][0-9]|[1-9][0-9])[.|/|[-]|\\s?]((may|jun|july|aug|sep|oct|nov|dec|jan|feb|march|april))");
        String time = ("(([0-1][0-9])|([2][0-4])|([1-9])):([0-5][0-9])[-|_|\\s?]?(am|AM|pm|PM)?");
      
      
      String dateAndTime= (time+"|"+dateP1+"|"+dateP2+"|"+dateP3+"|"+dateP4+"|"+dateP5+"|"+dateP6);
        String r_e = (dateAndTime+"|"+mail+"|"+mobile+"|"+url);
        FileReader kk = new FileReader("C:\\Users\\sam\\Desktop\\Uni Work\\Test-RegexText.txt");
        
        BufferedReader bf = new BufferedReader(kk);
   
        
        String line = bf.readLine();
   
        Pattern p =Pattern.compile(r_e);
        
        while(line!= null)
        {
            Matcher u = p.matcher(line);
            
            while (u.find())
            {
               System.out.println(u.group());
            }
            line=bf.readLine();
        }
        
    } 
    }
    

