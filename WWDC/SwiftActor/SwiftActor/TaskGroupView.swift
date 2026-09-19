//
//  TaskGroupView.swift
//  SwiftActor
//
//  Created by mk on 12/8/23.
//

import SwiftUI

struct TaskGroupView: View {
    var body: some View {
        Text("Task Group")
			.task {
				Task.init {
					await withTaskGroup(of: String.self) { group in
						group.addTask { await fetchResource(named: "First") }
						group.addTask { await fetchResource(named: "Second") }
						group.addTask { await fetchResource(named: "Third") }
						
						for await resource in group {
							print(resource)
						}
					}
				}
			}
    }
	
	func fetchResource(named: String) async -> String {
		return "Resource: \(named) - \(getIsMainThread() ? "Main" : "Sub"), ID: \(getThreadId()) / No: \(getThreadNumber())"
	}
}

#Preview {
    TaskGroupView()
}
