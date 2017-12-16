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