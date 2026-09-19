//
//  AsyncLet.swift
//  SwiftActor
//
//  Created by mk on 12/8/23.
//

import SwiftUI

struct AsyncLetView: View {
	@ViewBuilder
	var body: some View {
		// Concurrency Task
		Task {
			async let ta: () = asyncFunc(id: "CT-A")
			async let tb: () = asyncFunc(id: "CT-B")
			
			let res: [()] = await [ta, tb]
			print("Concurrency Tasks End: \(res.count)")
		}
		
		// Serial Task
		Task {
			await asyncFunc(id: "ST-A")
			await asyncFunc(id: "ST-B")
			print("Serial Tasks End!")
		}
		
		return Text("Task")
	}
	
	func asyncFunc(id: String) async {
		try? await Task.sleep(for: .seconds(2))
		print("Background Task: \(id)")
	}
}

#Preview {
    AsyncLetView()
}
