import UIKit

// Write an efficient function that takes stockPrices and returns the best profit
// I could have made from one purchase and one sale of one share of Apple stock yesterday.

/// `Expected:` returns 6 (buying for $5 and selling for $11)

let stockPrices = [10, 7, 5, 8, 11, 9]

func getMaxProfit(from stockPricesYesterday: [Int]) -> Int? {
  
  guard stockPricesYesterday.count >= 2 else {
      return nil
  }

  // we'll greedily update minPrice and maxProfit, so we initialize
  // them to the first price and the first possible profit
  var minPrice  = stockPricesYesterday[0]
  var maxProfit = stockPricesYesterday[1] - stockPricesYesterday[0]

  // start at the second (index 1) time
  // we can't sell at the first time, since we must buy first,
  // and we can't buy and sell at the same time!
  // if we started at index 0, we'd try to buy *and* sell at time 0.
  // this would give a profit of 0, which is a problem if our
  // maxProfit is supposed to be *negative*--we'd return 0.
  for currentPrice in stockPricesYesterday[1...] {

      // see what our profit would be if we bought at the
      // min price and sold at the current price
      let potentialProfit = currentPrice - minPrice

      // update maxProfit if we can do better
      maxProfit = max(maxProfit, potentialProfit)

      // update minPrice so it's always
      // the lowest price we've seen so far
      minPrice = min(minPrice, currentPrice)
  }

  return maxProfit
}

let maxProfit = getMaxProfit(from: stockPrices)
print("Max profit:", maxProfit!)
