import UIKit

func first() async throws -> String {
	print("called first")
	try await Task.sleep(nanoseconds: 2_000_000_000)	// Sleep 2s
	return "first"
}

func second() async throws -> String {
	print("called second")
	try await Task.sleep(nanoseconds: 2_000_000_000)	// Sleep 2s
	return "second"
}

func third() async throws -> String {
	print("called third")
	try await Task.sleep(nanoseconds: 2_000_000_000)	// Sleep 2s
	return "third"
}

print("start")
Task {
	let first = try await first()
	print(first)
}
Task {
	let second = try await second()
	print(second)
	
	let third = try await third()
	print(third)
}

print("end")
