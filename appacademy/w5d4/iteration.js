Array.prototype.bubbleSort = function() {
  var sorted = false;
  while (sorted === false) {
    sorted = true;
    for (var i = 0; i < this.length - 1; i++) {
      if (this[i] > this[i+1]) {
        var temp = this[i];
        this[i] = this[i+1];
        this[i+1] = temp;
        sorted = false;
      }
    }
  }
  return this;
};

console.log([4,6,3,8,9,3,5,2,1].bubbleSort());


var subStrings = function (str) {
  var result = [];
  for (var i = 0; i < str.length; i++) {
    for (var j = i + 1; j < str.length + 1; j++) {
      var sub = str.slice(i, j);
      if (result.indexOf(sub) === -1) {
        result.push(sub);
      }
    }
  }
  return result;
};

console.log(subStrings("cat"));
