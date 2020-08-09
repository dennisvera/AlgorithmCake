import UIKit

// Write a function that takes an array of characters and reverses the letters in place

var letters: [Character] = ["A", "B", "C", "D", "E", "F"]

func reverse(_ string: inout [Character]) -> [Character] {
  var reversedString: [Character] = []
  
  guard string.count > 0 else { return ["x"] }
  
  var leftIndex  = 0
  var rightIndex = string.count - 1
  
  while leftIndex < rightIndex {
    
    // swap characters
    let leftChar  = string[leftIndex]
    let rightChar = string[rightIndex]
    
    string[leftIndex] = rightChar
    string[rightIndex] = leftChar
    
    // move towards middle
    leftIndex  += 1
    rightIndex -= 1
    
    reversedString = string
  }
  
  return reversedString
}

print("Reversed string:", reverse(&letters))
