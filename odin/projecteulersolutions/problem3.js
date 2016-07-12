//Largest prime factor; Problem 3

//The prime factors of 13195 are 5, 7, 13 and 29.

//What is the largest prime factor of the number 600851475143 ?

var factors=[];
for(var i=2; i<600851475143; i++){
  if(600851475143%i==0){
    factors.push(i);
  }
}
var primes=[];
for(var i=0; i<factors.length; i++){
  if(factors[i]%2!==0){
    if(factors[i]%3!==0){
      if(factors[i]%2===1){
        primes.push(factors[i]);
      }
    }
  }
}

console.log(Math.max.apply(Math,primes));