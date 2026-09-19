//
//  AwaitAsyncView.swift
//  SwiftActor
//
//  Created by mk on 12/7/23.
//

import SwiftUI

struct AwaitAsyncView: View {
	@State var timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
		print("\(timer.fireDate.formatted(date: .omitted, time: .standard))")
	}
	
	var body: some View {
		Self._printChanges()
		Task {
			printNumbers()
		}
		return Text("Await/Async")
    }
	
	func printNumbers() {
		Task {
			await asyncFunction("Alpha")
			await asyncFunction("Bravo")
			await asyncFunction("Charlie")
			await asyncFunction("Delta")
			timer.invalidate()
		}
	}

	func asyncFunction(_ name: String) async {
		try? await Task.sleep(for: .seconds(1))
		print("\(timer.fireDate.formatted(date: .omitted, time: .standard)) - \(name): \(getIsMainThread() ? "Main" : "Sub"), ID: \(getThreadId()) / No: \(getThreadNumber()))")
	}
}

#Preview {
    AwaitAsyncView()
}
