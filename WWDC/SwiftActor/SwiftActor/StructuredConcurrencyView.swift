//
//  StructuredConcurrencyView.swift
//  SwiftActor
//
//  Created by mk on 12/12/23.
//

import SwiftUI

struct StructuredConcurrencyView: View {
	@State var threadSet = Set<String>()
	
	var timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
		//print("\(timer.fireDate.formatted(date: .omitted, time: .standard)) - Idle")
	}
	
	var body: some View {
		VStack {
			Text("Main: \(getIsMainThread()), " + "Thread Id: " + getThreadId())
				.padding(.bottom, 20)
			
			Text("Thread Count: \(threadSet.count)")
			
			List {
				ForEach(threadSet.sorted(), id: \.self) { item in
					Text("Thread ID: " + item)
				}
			}
		}
		.onAppear {
			print("\(timer.fireDate.formatted(date: .omitted, time: .standard)) - T0: \(getIsMainThread() ? "Main" : "Sub"), ID: \(getThreadId()) / No: \(getThreadNumber()))")
			Task {
				await makeTasks()
				// await printFibonacciSequence()
			}
		}
	}
	
	func makeTasks() async {
		for i in 1 ... 8 {
			try? await Task.sleep(for: .seconds(1))
			async let thread: () = asyncFunction("T\(i)")
			await thread
		}
	}

	func asyncFunction(_ seq: String) async {
		try? await Task.sleep(for: .seconds(1))
		print("\(timer.fireDate.formatted(date: .omitted, time: .standard)) - \(seq): \(getIsMainThread() ? "Main" : "Sub"), ID: \(getThreadId()) / No: \(getThreadNumber()))")
		threadSet.insert(getThreadId() + ", " + getThreadNumber())
	}
	
	
	func fibonacci(of number: Int) -> Int {
		var first = 0
		var second = 1

		for _ in 0..<number {
			let previous = first
			first = second
			second = previous + first
		}

		return first
	}
	
	func printFibonacciSequence() async {
		let task1 = Task { () -> [Int] in
			var numbers = [Int]()

			for i in 0..<50 {
				let result = fibonacci(of: i)
				numbers.append(result)
			}

			return numbers
		}

		let result1 = await task1.value
		print("The first 50 numbers in the Fibonacci sequence are: \(result1)")
	}
}

#Preview {
    StructuredConcurrencyView()
}
