
import java.io.*;

public class ClassifyFiles
{

    public static void main(String[] args)
    {
        
        
       final String CurrDir = System.getProperty("user.dir");
       String DataDir="";  
       if(args[2].equals("AF")){
         DataDir = CurrDir + "/ClassifiedAssgn/" + args[3];
       } 
       if(args[2].equals("A")){
         DataDir = CurrDir + "/" + "Data";
       }
       String BuildDir = CurrDir + "/" + "build";
       String classify_0_dir = CurrDir + "/ClassifiedAssgn/" + args[0];
       String classify_1_dir = CurrDir + "/ClassifiedAssgn/" + args[1];
       int linenum=0;
       int ClassifyStatus=0;
       String ClassifyDir;
       System.out.println("current dir = " + CurrDir);
       System.out.println("build dir = " + BuildDir);
       System.out.println("Data Directory is : " + DataDir);
       System.out.println("Classify 0 Directory is : " + classify_0_dir);
       System.out.println("Classify 1 Directory is : " + classify_1_dir);   

       InputStream inStream = null;
       OutputStream outStream = null;

 try{
 
      FileInputStream fstream = new FileInputStream(BuildDir + "/classify-all-output.txt");
     
      DataInputStream in = new DataInputStream(fstream);
      BufferedReader br = new BufferedReader(new InputStreamReader(in));
  
      String strLine;

      //Read File Line By Line
      while ((strLine = br.readLine()) != null)   {
        linenum++;
        // Print the content on the console
        if(linenum > 1) {
          String[] parts = strLine.split(",");
          String filename = parts[0];
          String isClassify = parts[3];
          String SrcFl;
          String DestFl;
          
          ClassifyStatus = Integer.parseInt(isClassify);
          if(ClassifyStatus == 0) {
            ClassifyDir=classify_0_dir;
          } else {
            ClassifyDir=classify_1_dir;
          }

          SrcFl =DataDir+"/"+filename;
          DestFl =ClassifyDir+"/"+filename;
 
          File Srcfile =new File(SrcFl);
          File Destfile =new File(DestFl);

          //System.out.println (SrcFl + " file is classifed to "+ DestFl); 
          Srcfile.renameTo(Destfile);
 /*
          inStream = new FileInputStream(Srcfile);
          outStream = new FileOutputStream(Destfile);
 
          byte[] buffer = new byte[1024];
          int length;

          while ((length = inStream.read(buffer)) > 0){
     	    outStream.write(buffer, 0, length);
     	  }
 
    	  inStream.close();
    	  outStream.close();
*/

          /*
          if(ClassifyStatus == 0) {
            System.out.println ("file : "+filename+" classify status : Move to IndAssgn Directory");
            
          }
          else {
            System.out.println ("file : "+filename+" classify status : Move to ExtAssgn Directory");
          }
          */

        } //end of if
    


      } // end of while loop

      System.out.println ("Files have been Classifed !");
      //Close the input stream
      in.close();
    }catch (Exception e){

       System.err.println("Error: " + e.getMessage());
    
    }



    }
}
