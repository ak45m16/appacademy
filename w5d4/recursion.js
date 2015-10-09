var rangeFunc = function(start, end) {
  if (end < start) {
    return [];
  }

  return [start].concat(rangeFunc(start + 1, end));
};

console.log(rangeFunc(0,9));

var recSum = function(arr) {
  if (arr.length === 1) {
    return arr[0];
  }
  if (arr.length === 0) {
    return 0;
  }

  return arr[0] + recSum(arr.slice(1));
};

console.log(recSum([1,2,3,4]));

var expoFunc = function(b, n) {
  if (n === 0) {
    return 1;
  }
  return b * expoFunc(b, n-1);
};

console.log(expoFunc(2,3));

var expoFunc2 = function(b, n) {
  if (n === 0) {
    return 1;
  }
  if (n === 1) {
    return b;
  }

  var temp = expoFunc2(b, n/2);

  if (n % 2 === 0) {
    return temp * temp;
  } else {
    return b * temp * temp;
  }
};

console.log(expoFunc2(2,4));


var fibFunc = function(n) {
  if (n < 3 ) {
    return [1,1].slice(0, n);
  }
  var temp = fibFunc(n-1);

  return temp.concat([recSum(temp.slice(-2))]);
};

console.log(JSON.stringify(fibFunc(5)));

// var binSearch = function(arr, target) {
//   if (arr.length === 1 ) {
//     if (arr[0] === target) {
//       return 0;
//     }
//    }
//   var mid_value = arr[arr.length/2];
//   if (mid_value === target) {
//     return arr.length/2;
//   }
//   var left = arr.slice(0, arr.length/2);
//   var right = arr.slice(arr.length/2, arr.length);
//   if (target < mid_value) {
//     binSearch(left, target);
//   } else {
//     right_index = binSearch(right, target)
//     if (right_index) {
//       return left.length + right_index;
//     }
//   }
// };

var bsearch = function(arr, target) {
  var mid = parseInt(arr.length / 2);
  if (arr[mid] === target) {
    return mid;
  }
  if (arr.length < 2) {
    return null;
  }

  var left = arr.slice(0, mid);
  var right = arr.slice(mid, arr.length);

  if (target < arr[mid]) {
    return bsearch(left, target);
  } else if (target > arr[mid]) {
    var rightIndex = bsearch(right, target);
    if (rightIndex) {
      return left.length + rightIndex;
    }
  }
  return null;
};
console.log("Bsearch");
console.log(bsearch([1, 4, 8, 9 ],7));


var mergeSort = function (arr) {
  if (arr.length <2) {
    return arr;
  }
  var mid = parseInt(arr.length / 2);
  var left = arr.slice(0, mid);
  var right = arr.slice(mid, arr.length);

  return mergeHelper(mergeSort(left), mergeSort(right));
};

var mergeHelper = function (left, right) {
  var mergedArr = [];
  while (left.length > 0 && right.length > 0) {
    if (left[0] < right[0]) {
      mergedArr.push(left[0]);
      left.shift();
    }
    else{
      mergedArr.push(right[0]);
      right.shift();
    }
  }
  return mergedArr.concat(left).concat(right);
};

console.log(mergeSort([8,4,8,4,3,9,56,23345,2,1]));

var subSets = function(arr) {
  if (arr.length === 0) {
    return [arr];
  }

  var prevSets = subSets(arr.slice(0, arr.length - 1));
  var newSets = [];
  for (var i = 0; i < prevSets.length; i++) {
    newSets.push(prevSets[i].concat(arr.slice(-1)));
  }

  return prevSets.concat(newSets);
};

console.log(JSON.stringify(subSets([1,2,3])));


// var newSets = prevSets.forEach(addLastElem);
//
// var addLastElem = function (set) {
//   set.push(arr[arr.length - 1]);
// };

// var makeChange = function (val, arr) {
//   if (val === 0) {
//     return [];
//   }
//   var resultArr = [];
//   for (var i = 0; i < arr.length; i++) {
//     if (arr[i] < val ) {
//       resultArr.push(arr[i]);
//       val = val - arr[i];
//       i = i - 1;
//     }
//   }
// 
// };
