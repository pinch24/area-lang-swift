import UIKit

func wake() async throws -> String {
	try await Task.sleep(nanoseconds: 2_000_000_000)	// Sleep 2s
	return "Awake!"
}

print("[Evening]")

Task {
	let message = try await wake()
	print(message)
}

print("[Morning]")
