//
//  TaskView.swift
//  SwiftActor
//
//  Created by mk on 12/14/23.
//

import SwiftUI

struct TaskView: View {
	@State private var image: UIImage?
	
	var body: some View {
		Group {
			if let image = image {
				Image(uiImage: image)
					.resizable()
					.aspectRatio(contentMode: .fit)
			}
			else {
				Image(systemName: "xmark.icloud")
					.resizable()
					.aspectRatio(contentMode: .fit)
			}
		}
		.onAppear {
			Task {
				do {
					image = try await self.fetchImage(url: "https://picsum.photos/1024")
				}
				catch {
					image = UIImage(systemName: "xmark")
				}
			}
		}
	}
	
	func fetchImage(url: String) async throws -> UIImage? {
		if let url = URL(string: url) {
			let (data, _) = try await URLSession.shared.data(from: url)
			return UIImage(data: data)
		}
		return UIImage(systemName: "xmark.square")
	}
}

#Preview {
	TaskView()
}
