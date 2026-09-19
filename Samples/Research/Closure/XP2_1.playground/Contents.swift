import UIKit

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
	var runnungTotal = 0
	
	func increment() -> Int {
		runnungTotal += amount
		return runnungTotal
	}
	
	return increment
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()
