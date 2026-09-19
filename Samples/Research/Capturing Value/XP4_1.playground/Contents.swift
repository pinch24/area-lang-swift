import UIKit

struct Test {
	var number: String?
}

var test = Test()
test.number = "1"

let closure = { [test] in
	print("Closure: \(test.number)")
}

test.number = "2"

let result = closure
result()
