//Multiples of 3 and 5; Problem 1

//If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

//Find the sum of all the multiples of 3 or 5 below 1000.

var sum=0                     // sum is 0
for (var i=1; i<1000; i++){   //iterate through numbers until 999
  if(i%3===0 || i%5===0){     //check if it is a multiple
    sum=sum+i                 //add it to the sum if it is
  }
}
return(sum)