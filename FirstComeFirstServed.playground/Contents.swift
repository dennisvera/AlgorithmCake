import UIKit

// Given all three arrays, write a function to check that my service is first-come, first-served.
// All food should come out in the same order customers requested it

let takeOut = [1, 3, 5]
let dineIn = [2, 4, 6]
let served = [1, 2, 4, 6, 5, 3]

func isFirstComeFirstServed(takeOutOrders: [Int], dineInOrders: [Int], servedOrders: [Int]) -> Bool {
  
  var takeOutOrdersIndex = 0
  var dineInOrdersIndex = 0
  let takeOutOrdersMaxIndex = takeOutOrders.count - 1
  let dineInOrdersMaxIndex = dineInOrders.count - 1
  
  for order in servedOrders {
    
    // if we still have orders in takeOutOrders
    // and the current order in takeOutOrders is the same
    // as the current order in servedOrders
    if takeOutOrdersIndex <= takeOutOrdersMaxIndex && order == takeOutOrders[takeOutOrdersIndex] {
      takeOutOrdersIndex += 1
      
      // if we still have orders in dineInOrders
      // and the current order in dineInOrders is the same
      // as the current order in servedOrders
    } else if dineInOrdersIndex <= dineInOrdersMaxIndex && order == dineInOrders[dineInOrdersIndex] {
      dineInOrdersIndex += 1
      
      // if the current order in servedOrders doesn't match the current
      // order in takeOutOrders or dineInOrders, then we're not serving first-come,
      // first-served
    } else {
      return false
    }
  }
  
  // check for any extra orders at the end of takeOutOrders or dineInOrders
  if (dineInOrdersIndex != dineInOrders.count || takeOutOrdersIndex != takeOutOrders.count) {
    return false
  }
  
  // all orders in servedOrders have been "accounted for"
  // so we're serving first-come, first-served!
  return true
}

isFirstComeFirstServed(takeOutOrders: takeOut, dineInOrders: dineIn, servedOrders: served)
