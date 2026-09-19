//
//  ContentView.swift
//  SwiftActor
//
//  Created by mk on 12/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
			Text("Swift Actor")
				.bold()
        }
        .padding()
		
		Spacer()
		
		// AwaitAsyncView()
		TaskView()
		// TaskTestView()
		// AsyncLetView()
		// TaskGroupView()
		// SwiftUIDebugView()
		// SwiftActorView()
		// SharedWalletActorView()
		// StructuredConcurrencyView()
		// FetchImageView()
		// CounterView()
		
		Spacer()
    }
}

#Preview {
    ContentView()
}
