import java.io.*;
import java.net.*;

public class DailyAdviceClient {
  BufferedReader reader;
  PrintWriter writer;
  Socket sock;
  
  public static void main(String[] args) {
    DailyAdviceClient client = new DailyAdviceClient();
    client.go();
  }
  
  public void go() {
    try {
      Socket s = new Socket("127.0.0.1", 4242);
      InputStreamReader streamReader = new InputStreamReader(s.getInputStream());
      reader = new BufferedReader(streamReader);
      writer = new PrintWriter(s.getOutputStream());
      
      System.out.println("networking established");
      
      while (true) {
        writer.println("YEEHAW!");
      }
      // writer.flush();
      
      
      
      // Thread readerThread = new Thread(new IncomingReader());
      // readerThread.start();
    } catch (IOException ex) {
      ex.printStackTrace();
    }
  }
  
  public class IncomingReader implements Runnable {
    public void run() {
      String message;
      try {
        while ((message = reader.readLine()) != null) {
          System.out.println("read " + message);
        }
      } catch (Exception ex) {
        ex.printStackTrace();
      }
    }
  }
}