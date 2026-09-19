//
//  ImageView.swift
//  SwiftActor
//
//  Created by mk on 12/12/23.
//

import SwiftUI

struct ImageView: View {
	@State private var image: UIImage?
	@State private var isLoading = true
	
	var body: some View {
		Group {
			if let image = image {
				Image(uiImage: image)
					.resizable()
					.aspectRatio(contentMode: .fit)
			}
			else if isLoading {
				ProgressView()
			}
			else {
				Text("Failed to load image")
			}
		}
		.task {
			do {
				let id = UUID().uuidString.prefix(4).description
				image = try await downloadImage(urlString: "https://picsum.photos/1024", id: id, step: 1)
			}
			catch {
				print("Failed to fetch thumbnail: \(error)")
			}
			isLoading = false
		}
	}
}

#Preview {
	ImageView()
}
