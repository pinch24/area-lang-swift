//
//  ContentView.swift
//  SwiftUIDebug
//
//  Created by mk on 12/13/23.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		Self._printChanges()
		return TimerCountFixedView()
	}
	
	func fetchResource(named: String) async -> String {
		return "Resource: \(named)"
	}
}

struct TimerCountFixedView: View {
	@State var count = 0
	
	let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
	
	var body: some View {
		Self._printChanges()
		return VStack {
			Text("Count is now: \(count)!")
				.onReceive(timer) { input in
					count += 1
				}
			AnimatedButton()
		}
	}
}

struct AnimatedButton: View {
	@State var animateButton = true
	
	var body: some View {
		Self._printChanges()
		return Button {
			animateButton.toggle()
		} label: {
			Text("SAVE")
				.font(.system(size: 36, weight: .bold, design: .rounded))
				.foregroundColor(.white)
				.padding(.vertical, 6)
				.padding(.horizontal, 80)
				.background(Color.random)
				.cornerRadius(50)
				.shadow(color: .secondary, radius: 1, x: 0, y: 5)
		}
		.rotationEffect(
			Angle(degrees: animateButton ? Double.random(in: -8.0...1.5) : Double.random(in: 0.5...16)))
		.onAppear {
			withAnimation(.easeInOut(duration: 1).delay(0.5).repeatForever(autoreverses: true)) {
				animateButton.toggle()
			}
		}
	}
}

extension Color {
	static var random: Color {
		return Color(
			red: .random(in: 0...1),
			green: .random(in: 0...1),
			blue: .random(in: 0...1)
		)
	}
}


#Preview {
    ContentView()
}

