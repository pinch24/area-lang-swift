//
//  TaskTestView.swift
//  SwiftActor
//
//  Created by mk on 12/9/23.
//

import SwiftUI

struct TaskTestView: View {
	@State var threadSet = Set<String>()
	
	var timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
		print("\(timer.fireDate.formatted(date: .omitted, time: .standard)) - Idle")
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
		.task {
			print("\(timer.fireDate.formatted(date: .omitted, time: .standard)) - T0: \(getIsMainThread() ? "Main" : "Sub"), ID: \(getThreadId()) / No: \(getThreadNumber()))")
			makeTasks()
		}
	}
	
	func makeTasks() {
		Task {
			print("---------------- Start ----------------")
			try? await Task.sleep(for: .seconds(1))
			await asyncFunction("T1.1")
			Task {
				try? await Task.sleep(for: .seconds(1))
				await asyncFunction("T1.2")
				Task {
					try? await Task.sleep(for: .seconds(1))
					await asyncFunction("T1.3")
				}
			}
		}
		Task {
			try? await Task.sleep(for: .seconds(4))
			await asyncFunction("T2.1")
			
			Task {
				try? await Task.sleep(for: .seconds(4))
				await asyncFunction("T2.2")
			}
		}
		Task {
			try? await Task.sleep(for: .seconds(5))
			await asyncFunction("T3.1")
			Task {
				try? await Task.sleep(for: .seconds(5))
				await asyncFunction("T3.2")
			}
		}
		
		// for i in 1 ... 100 {
		// 	Task {
		// 		try? await Task.sleep(for: .seconds(12))
		// 		await asyncFunction("T4.\(i)")
		// 	}
		// }
		
		Task {
			try? await Task.sleep(for: .seconds(18))
			timer.invalidate()
			print("---------------- End ----------------")
		}
	}

	func asyncFunction(_ seq: String) async {
		print("\(timer.fireDate.formatted(date: .omitted, time: .standard)) - \(seq): \(getIsMainThread() ? "Main" : "Sub"), ID: \(getThreadId()) / No: \(getThreadNumber()))")
		threadSet.insert(getThreadId() + ", " + getThreadNumber())
	}
}

#Preview {
    TaskTestView() 
}
