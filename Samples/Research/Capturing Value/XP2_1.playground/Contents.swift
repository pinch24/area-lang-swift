import UIKit

class Test {
	var number: String?
}

let test = Test()
test.number = "1"

let closure = { [test] in
	print("Closure: \(test.number)")
}

test.number = "2"

let result = closure
result()
