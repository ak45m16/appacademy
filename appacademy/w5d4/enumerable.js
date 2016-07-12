var myEach = function (arr, func) {
  for (var i = 0; i < arr.length; i++) {
    func(arr[i]);
  }
  return arr;
};

var eachTest = function(a) {
  console.log((a * 2));
};

console.log(myEach([1,2,3], eachTest));

var myMap = function (arr, mappingFunction) {
  var resultArr = [];

  var mapWrapper = function (arrElem) {
    resultArr.push(mappingFunction(arrElem));
  };

  myEach(arr, mapWrapper);

  return resultArr;
};

var mapTest = function (a) {
  return (a * 2);
};

console.log(myMap([1,2,3], mapTest));


var myInject = function (arr, injectFunc) {
  var acc = arr[0];

  var injectWrapper = function (arrElem) {
    acc = injectFunc(arrElem, acc);
  };
  myEach(arr.slice(1), injectWrapper);
  return acc;
};

var injectTest = function (a, acc) {
  return acc * a;
};

console.log(myInject([1,2,3], injectTest));
