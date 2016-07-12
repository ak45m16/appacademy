var uniq = function (arr) {
  var uniqArr = [];
  for (var i = 0; i < arr.length; i++) {
    if (uniqArr.indexOf(arr[i]) === -1) {
      uniqArr.push(arr[i]);
    }
  }
  return uniqArr;
};

var twoSum = function(arr) {
  var ind_arr = []
  for (var i = 0; i < arr.length; i++) {
    for (var j = i + 1; j < arr.length; j++) {
      if (arr[i] + arr[j] === 0) {
        ind_arr.push([i,j])
      }
    }
  }
  return ind_arr
}

Array.prototype.myTranspose = function() {
  var transp_arr = [];
  for (var i = 0; i < this.length; i++) {
    var row = [];
    for (var j = 0; j < this.length; j++) {
      row.push(this[j][i]);
    }
    transp_arr.push(row);
  }
  return transp_arr;
}

var arr = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ];
console.log(JSON.stringify(arr.myTranspose()));
