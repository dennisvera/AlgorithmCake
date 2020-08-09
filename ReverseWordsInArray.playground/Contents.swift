import UIKit

// Write a function reverseWords() that takes a message as an array of characters and reverses the order of the words in place.

var message: [Character] = ["c", "a", "k", "e", " ",
                            "p", "o", "u", "n", "d", " ",
                            "s", "t", "e", "a", "l"]

func reverseWords(_ message: inout [Character]) -> String {
  // first we reverse all the characters in the message
  reverseCharacters(&message, from: message.startIndex, until: message.endIndex)
  
  // this gives us the right word order
  // but with each word backward
  // now we'll make the words forward again
  // by reversing each word's characters
  
  // we hold the index of the *start* of the current word
  // as we look for the *end* of the current word
  var currentWordStartIndex = message.startIndex
  
  for i in message.indices {
    
    // found the end of the current word!
    if message[i] == " " {
      
      // the next word's start is one character ahead
      reverseCharacters(&message, from: currentWordStartIndex, until: i)
      currentWordStartIndex = message.index(after: i)
    }
  }
  
  // now we just need to reverse the last word
  reverseCharacters(&message, from: currentWordStartIndex, until: message.endIndex)
  
  return String(message)
}


func reverseCharacters(_ string: inout [Character], from startIndex: Int, until endIndex: Int) {
  
  guard string.count > 0 else {
    return
  }
  
  var leftIndex  = startIndex
  var rightIndex = endIndex - 1
  
  while leftIndex < rightIndex {
    
    // swap characters
    let leftChar  = string[leftIndex]
    let rightChar = string[rightIndex]
    
    string[leftIndex] = rightChar
    string[rightIndex] = leftChar
    
    // move towards middle
    leftIndex  += 1
    rightIndex -= 1
  }
}

print(reverseWords(&message))
