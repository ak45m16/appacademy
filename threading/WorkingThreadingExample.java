class WorkingThreadingExample {
  public static void main(String[] args) {
    Person person = new Person();
    
    Thread threadA = new Thread(new Runnable() {
      @Override
      public void run() {
        for (int i = 0; i < 1000 ; i++) {
          person.increment();
        }    
      }        
    });
    
    Thread threadB = new Thread(new Runnable() {
      @Override
      public void run() {
        for (int i = 0; i < 1000 ; i++) {
          person.increment();
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
  
  public synchronized void increment() {
    this.count = this.count + 1;
  }
}