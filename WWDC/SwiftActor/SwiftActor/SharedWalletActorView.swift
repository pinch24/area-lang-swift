//
//  SharedWalletActorView.swift
//  SwiftActor
//
//  Created by mk on 12/9/23.
//

import SwiftUI

struct SharedWalletActorView: View {
    var body: some View {
		Task {
			let wallet = SharedWallet(amount: 360000)
			let name = wallet.name
			await wallet.spendMoney(amount: 3000)
			let amount = await wallet.amount
			print("\(name): \(amount)")
		}
		return Text("SharedWallet Actor")
    }
}

actor SharedWallet {
	let name = "Team Fees"
	var amount: Int = 0
	
	init(amount: Int) {
		self.amount = amount
	}
	
	func spendMoney(amount: Int) {
		self.amount -= amount
	}
}

#Preview {
    SharedWalletActorView()
}
