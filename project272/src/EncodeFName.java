import java.io.*;

// Class to store each filerecord
class filerecord implements Serializable {

   private String filename;
   private int hashtag;
//   private int ctype;
   
   public filerecord(String filename, int hashtag/*, int ctype*/) {
     this.filename = filename;
     this.hashtag = hashtag; 
   //  this.ctype = ctype;
   }

   public String toString() {
     if(hashtag ==0 /*&& ctype == 0*/) {
       return (filename);
     } else {
       return (filename + "," + hashtag + "," /*+ ctype*/);
     }     
   }

}

//Class to Encode the entries into classify.txt
public class EncodeFName {
 
  //Simple Function to convert string to a random but unique int vector.
  public static int myhash(String str) {
     int hash=0;   
     int c;
     for(int i = 0; i < str.length(); i++) {
       c=str.charAt(i);
       hash = hash + c;
     }

     return hash;
  }

  public static void main(String[] args) {
 
    //Directory path for the Data folder that will contain all the doc and pdf files
    String path = args[2]; 

    System.out.println("Data Directory is : " + path);
    String filename;
    String tagname="";
    int namehash;
    int ctype;
    String FileWrite;
    File folder = new File(path);
    String cfilename = args[0];
    File[] listOfFiles = folder.listFiles(); 
    //System.out.println("\"filename\",\"nametag\",\"atype\"");
    
    //Stage 1 : Generate the classify-all.txt file
    try {
        //System.out.println("filename: " + cfilename + "-all.txt");
        PrintWriter out = new PrintWriter(cfilename + "-all.txt");
        if(args[1].equals("atype")) {
          out.println(new filerecord("\"filename\",\"nametag\",\"atype\",\"classify\"",0/*,0*/));
        }
        if(args[1].equals("ftype")) {
          out.println(new filerecord("\"filename\",\"nametag\",\"ftype\",\"classify\"",0/*,0*/));
        }
        

        //For Each file in the Data directory  
        for (int i = 0; i < listOfFiles.length; i++) {
 
          if (listOfFiles[i].isFile()) {

            //Step 1: Get the filenames in the directory
            filename = listOfFiles[i].getName();
            //System.out.print(filename);
            //out.print(filename);

            /*Step 2: Check what needs to be classified:
                       if its atype -> then Assignment type classification
                          For atype classification get the first 3 characters
                       if its ftype -> then file type classification
                          For ftype classification get the last 3 characters
            */
            if(args[1].equals("atype")) {
              tagname = filename.substring(0,3);
            }
            if(args[1].equals("ftype")) {
              tagname = filename.substring(filename.length() - 3);
            }
            //System.out.print("," +tagname);

            //Step 3: Get the hash value of the tag
            namehash = myhash(tagname);
            //System.out.print(","+namehash);
            //out.print(","+namehash);
        
            //Step 4: Initialize ctype value = 0
            //ctype = 0;
                   
            //Step 5: Write the Record in the format: filename,tag,ctype
            out.println(new filerecord(filename,namehash/*,ctype*/));
            
          } //end of if function

        } // end of for loop
        out.close();
     } catch (Exception e) { //end of try block 
        e.printStackTrace();
     } finally {
         
     }  

             

  } //end of main function

} // end of class
