var readline = require("readline");

var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function HanoiGame () {
  this.stack1 = [3,2,1];
  this.stack2 = [];
  this.stack3 = [];
}

HanoiGame.prototype.isWon = function () {
  if (this.stack1.length === 0 && (this.stack2.length === 3 || this.stack2.length === 3)){
    return true;
  }
  else {
    return false;
  }
};

HanoiGame.prototype.isValidMove = function (startTower, endTower) {
  if (startTower.length === 0) {
    return false;
  }
  else if  (endTower.length === 0 || (startTower[startTower.length - 1] < endTower[endTower.length -1])) {
    return true;
  }
  else {
    return false;
  }
};

HanoiGame.prototype.move = function (startTower, endTower) {
  if (this.isValidMove(startTower, endTower)) {
    endTower.push(startTower.pop());
    return true;
  } else {
    return false;
  }
};

HanoiGame.prototype.print = function() {
  console.log("stack1:" + JSON.stringify(this.stack1));
  console.log("stack2:" + JSON.stringify(this.stack2));
  console.log("stack3:" + JSON.stringify(this.stack3));
};

HanoiGame.prototype.promptMove = function(callback) {
  this.print();

  reader.question("What stack to move from?", function (startmove) {
    reader.question("What stack to move to?"), function (endmove) {
      callback(startmove, endmove);
     };
  });
};

HanoiGame.prototype.run = function (completionCallback) {
  if (this.promptMove(this.move) === false) {
    console.log("ERROR!");
  }
  if (this.isWon) {
    console.log("YOU HAVE WON!");
    this.completionCallback();
  } else {
    this.run(completionCallback);
  }
};

HanoiGame.prototype.completionCallback = function () {
  reader.close();
};

var hanoi = new HanoiGame();
hanoi.run(this.completionCallback);

module.exports = HanoiGame;
