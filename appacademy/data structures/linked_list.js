var fs = require('fs');

function Node(value) {
  this.value = value;
  this.next = null;
}

function LinkedList() {
  this.root = null;
  
  this.addStart = function(value) { // 0(1)
    var node = new Node(value);
    node.next = this.root;
    this.root = node;
  };
  
  this.addEnd = function(value) { // O(n)
    var node = new Node(value);
    var prev = null;
    var current = this.root;
    
    while (current) {
      prev = current;
      current = current.next;  
    }
    
    if (prev) {
      prev.next = node;
    } else {
      this.root = node;
    }
  };
  
  this.addAt = function (value, index) { // O(n)
    var node = new Node(value);
    var prev = null;
    var current = this.root;
    
    while (index > 0) {
      prev = current;
      current = current.next;  
      index -= 1; 
    }
    
    if (prev) {
      prev.next = node;
      node.next = current;
    } else {
      this.root = node;
    }
    
  }; 
  
  this.deleteStart = function() { // O(1)
    var next = this.root.next;
    this.root.next = null;
    this.root = next;
  }; 
  
  this.deleteEnd = function() { // O(n)
    var prev = null;
    var current = this.root;
    
    while (current.next !== null) {
      prev = current;
      current = current.next;  
    }
    
    if (prev) {
      prev.next = null;
    } else {
      this.root = null;
    }
    
  };

  this.deleteAt = function (index) { // O(n)
    var prev = null;
    var current = this.root;
    
    while (index > 0) {
      prev = current;
      current = current.next;  
      index -= 1; 
    }
    
    if (prev) {
      prev.next = current.next;
    } else {
      this.root.next = null;
    }
    
  };
  
  this.get = function(index) { // O(n)
    var prev = null;
    var current = this.root;
    
    while (index >= 0) {
      prev = current;
      current = current.next;  
      index -= 1; 
    }
    
    if (prev) {
      console.log(prev.value);
    } else {
      console.log(this.root.value);
    }
  };
  
  this.indexOf = function(value) { // O(n)
    var current = this.root;
    var index = 0;
    while (current) {
      if (current.value === value) {
        console.log(index);
      }
      current = current.next;
      index += 1;
    }
    
  }; 
  
  this.print = function(filename) {
    var current = this.root;
    var log = function(str) { console.log(str); };
    if (filename) {
      var file = fs.openSync(filename, 'w');
      log = function(str) { fs.write(file, str); }
    }

    log("digraph BST {");
    while (current && current.next) {
      log("  " + current.value + " -> " + current.next.value);
      current = current.next;
    }
    if (current) {
      log("  " + current.value + " -> null");
    }
    log("  null [shape=point]");
    log("}");

  };
  
}

var input = [9,4,2,5,8,3,1,7,6];
var ll = new LinkedList();
input.forEach(i => ll.addStart(i));
ll.indexOf(5);
ll.print();

