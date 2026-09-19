import UIKit

class A {
	var b: Int = 1
	
	func afterTwoSecPrint() {
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
			self?.b = 99
			print("b: \(self?.b ?? 0)")
		}
	}
	
	init() {
		print("Memory Allocated.")
	}
	
	deinit {
		print("Memory Released.")
	}
}

var a: A? = A()

a?.afterTwoSecPrint()

a = nil
print("a Assigned to nil.")
