import UIKit

var number = "1"

let closure = { [number] in
	print("Closure: \(number)")
}

number = "2"

let result = closure
result()
