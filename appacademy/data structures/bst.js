var fs = require('fs');

function Node(key) {
  this.key = key;
  this.left = null;
  this.right = null;
  this.deleted = false;
  
  this.insert = function (key) { // O(logn)
    if (key < this.key) {
      if (this.left) {
        this.left.insert(key);
      } else {
        this.left = new Node(key);
      }
    } else if (key > this.key) {
      if (this.right) {
        this.right.insert(key);
      } else {
        this.right = new Node(key);
      }
    }
  }
  
  this.lookup = function (key) { // O(logn)
    if (key === this.key && !this.deleted) {
      return true;
    }
    
    if (key < this.key && this.left) {
      this.left.lookup(key);
    } else if (key > this.key && this.right) {
      this.right.lookup(key);
    }
    return false;
  }
  
  this.delete = function () { // O(logn)
    if (key === this.key) {
      this.deleted = true;
    }
    
    if (key < this.key && this.left) {
      this.left.delete(key);
    } else if (key > this.key && this.right) {
      this.right.delete(key);
    }    
  }
  
  this.print = function(node, isRoot) {
    isRoot = isRoot == null ? true : isRoot;
    var null_left = "null_" + node.key + "_left";
    var null_right = "null_" + node.key + "_right"
    
    if (isRoot) {
      console.log("digraph BST {");
    }
    
    console.log("  " + node.key + " -> " + (node.left ? node.left.key : null_left));
    console.log("  " + node.key + " -> " + (node.right ? node.right.key : null_right));

    if (node.left) {
      this.print(node.left, false);
    } else {
      console.log("  " + null_left + " [shape=point]");
    }
    if (node.right) {
      this.print(node.right, false);
    } else {
      console.log("  " + null_right + " [shape=point]");
    }
    if (isRoot) {
      console.log("}");
    }
  };
}

var rootNode = null;
var input = [5,3,7,4,2,1,6,8,9];

for (var i = 0; i < input.length; i++) {
  if (i === 0) {
    rootNode = new Node(input[i]);
  } else {
    rootNode.insert(input[i]);
  }
}
rootNode.print(rootNode, true);
