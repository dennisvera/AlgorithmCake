import UIKit

// Write a function to merge two arrays into one sorted array.

let arrayOne = [3, 4, 6, 10, 11, 15]
let arrayTwo = [1, 5, 8, 12, 14, 19]

func mergeArrays(_ arrayOne: [Int], _ arrayTwo: [Int]) -> [Int] {
  
  // set up mergedArray
  var mergedArray = Array(repeating: 0, count: arrayOne.count + arrayTwo.count)
  
  var currentIndexArrayOne = 0
  var currentIndexArrayTwo = 0
  var currentIndexMerged = 0
  
  while currentIndexMerged < mergedArray.count {
    
    let isArrayOneExhausted = currentIndexArrayOne >= arrayOne.count
    let isArrayTwoExhausted = currentIndexArrayTwo >= arrayTwo.count
    
    // case: next comes from array one
    // array one must not be exhausted, and EITHER:
    // 1) array two IS exhausted, or
    // 2) the current element in array one is less
    //    than the current element in array two
    if !isArrayOneExhausted && (isArrayTwoExhausted || arrayOne[currentIndexArrayOne] < arrayTwo[currentIndexArrayTwo]) {
      
      mergedArray[currentIndexMerged] = arrayOne[currentIndexArrayOne]
      currentIndexArrayOne += 1
      
      // case: next comes from array two
    } else {
      mergedArray[currentIndexMerged] = arrayTwo[currentIndexArrayTwo]
      currentIndexArrayTwo += 1
    }
    
    currentIndexMerged += 1
  }
  
  return mergedArray
}

mergeArrays(arrayOne, arrayTwo)
