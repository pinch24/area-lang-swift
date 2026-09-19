//
//  ContentView.swift
//  FetchImage
//
//  Created by mk on 12/13/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
			// Background Color
			LinearGradient(
				gradient: Gradient(colors: [.black, .gray, .white]),
				startPoint: .topLeading,
				endPoint: .bottomTrailing)
			
			MultiImageView()
			// ImageView()
        }
		.ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
