//
//  CounterView.swift
//  SwiftActor
//
//  Created by mk on 12/14/23.
//

import SwiftUI

struct CounterView: View {
	@State private var count = 0
	
    var body: some View {
		VStack {
			Text("Count: \(count)")
			
			HStack {
				Button(action: {
					count -= 1
				}, label: {
					Text("-")
				})
				
				Button(action: {
					count += 1
				}, label: {
					Text("+")
				})
			}
		}
    }
}

#Preview {
    CounterView()
}
