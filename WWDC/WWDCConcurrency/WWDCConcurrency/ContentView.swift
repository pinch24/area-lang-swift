//
//  ContentView.swift
//  WWDCConcurrency
//
//  Created by mk on 12/15/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("WWDC Concurrency")
			
			/// WWDC 2021 - Meet async/await in Swift
			// WWDC2021_10132()
			
			/// WWDC 2021 - Protect mutable state with Swift actors
			WWDC2021_10133()
			// WWDC2021_10133_Bugs()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
