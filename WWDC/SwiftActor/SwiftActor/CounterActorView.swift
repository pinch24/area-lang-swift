//
//  CounterActorView.swift
//  SwiftActor
//
//  Created by mk on 12/12/23.
//

import SwiftUI

struct CounterActorView: View {
    var body: some View {
		Task {
			let counter = Counter()
			Task.detached {
				print(await counter.increment())
			}
			Task.detached {
				print(await counter.increment())
			}
		}
		return Text("Counter Actor")
    }
}

#Preview {
    CounterActorView()
}

actor Counter {
	var value = 0
	
	func increment() -> Int {
		value = value + 1
		return value
	}
}

#Preview {
	SharedWalletActorView()
}
