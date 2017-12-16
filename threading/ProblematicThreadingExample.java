class ProblematicThreadingExample {
  public static void main(String[] args) {
    Person person = new Person();
    
    Thread threadA = new Thread(new Runnable() {
      @Override
      public void run() {
        for (int i = 0; i < 1000 ; i++) {
          person.count++;
        }    
      }        
    });
    
    Thread threadB = new Thread(new Runnable() {
      @Override
      public void run() {
        for (int i = 0; i < 1000 ; i++) {
          person.count++;
        }    
      }        
    });
    
    threadA.start();
    threadB.start();
    
    try {
      threadA.join();
      threadB.join();
    } catch (InterruptedException e) {
    }
    
    System.out.println(person.count);
  }
}

class Person {
  Integer count = 0;
}