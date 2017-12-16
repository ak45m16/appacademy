import java.io.*;
import java.net.*;
import java.util.*;

public class DailyAdviceServer {
  ArrayList<PrintWriter> clientOutputStreams;
  
  public static void main(String[] args) {
    DailyAdviceServer server = new DailyAdviceServer();
    server.go();
  }
  
  public void go() {
    clientOutputStreams = new ArrayList<PrintWriter>();
    try {
      ServerSocket serverSock = new ServerSocket(4242);
      while (true) {
        Socket sock = serverSock.accept();
        PrintWriter writer = new PrintWriter(sock.getOutputStream());
        // clientOutputStreams.add(writer);
        
        // Thread t = new Thread(new ClientHandler(sock));
        // t.start();
        
        InputStreamReader isReader = new InputStreamReader(sock.getInputStream());
        BufferedReader reader = new BufferedReader(isReader);
        System.out.println(reader.readLine());
        System.out.println("got a connection");
      }
    } catch (IOException ex) {
      ex.printStackTrace();
    }
  }

  public class ClientHandler implements Runnable {
    BufferedReader reader;
    Socket sock;
    
    public ClientHandler(Socket clientSocket) {
      try {
        sock = clientSocket;
        InputStreamReader isReader = new InputStreamReader(sock.getInputStream());
        reader = new BufferedReader(isReader);
      } catch (Exception ex) {
        ex.printStackTrace();
      }
    }
    
    public void run() {
      String message;
      try {
        while ((message = reader.readLine()) != null) {
          System.out.println("read " + message);
          tellEveryone(message);
        }
      } catch (Exception ex) {
        ex.printStackTrace();
      }
    }
  }
  
  public void tellEveryone(String message) {
    Iterator it = clientOutputStreams.iterator();
    while (it.hasNext()) {
      try {
        PrintWriter writer = (PrintWriter) it.next();
        writer.println(message);
        writer.flush();
      } catch (Exception ex) {
        ex.printStackTrace();
      }
    }
  }
}