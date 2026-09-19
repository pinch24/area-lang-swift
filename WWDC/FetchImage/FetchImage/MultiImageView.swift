//
//  MultiImageView.swift
//  SwiftActor
//
//  Created by mk on 12/12/23.
//

import SwiftUI

struct MultiImageView: View {
	@State private var images: [String: UIImage] = [:]
	@State private var isLoading = true
	@State private var isRefreshing = false
	
	var body: some View {
		VStack {
			// Scroll Images
			if isLoading {
				ProgressView()
					.scaleEffect(2.0)
			}
			else if images.isEmpty {
				Text("Failed to load images")
			}
			else {
				ScrollViewReader { proxy in
					ScrollView {
						VStack {
							if isRefreshing {
								ProgressView()
									.scaleEffect(4.0)
									.frame(width: 88, height: 88)
									.id(0)
									.task {
										proxy.scrollTo(0)
										await refreshImages()
										isRefreshing = false
									}
							}
							ForEach(images.keys.sorted(), id: \.self) { key in
								if let image = images[key] {
									Image(uiImage: image)
										.resizable()
										.aspectRatio(contentMode: .fit)
										.padding(.bottom, 22)
								}
							}
						}
					}
					.coordinateSpace(name: "pullToRefresh")
					.gesture(DragGesture(coordinateSpace: .named("pullToRefresh")).onEnded { value in
						print("DragGesture: \(value.translation.height)")
						if value.translation.height > 34 {
							isRefreshing = true
						}
					})
					.gesture(TapGesture(count: 2).onEnded { value in
						print("TapGesture: \(value)")
						isRefreshing = true
					})
				}
			}
		}
		.ignoresSafeArea()
		.task {
			print(getThreadInfo(), #function)
			await refreshImages()
		}
	}
	
	func refreshImages() async {
		do {
			images = try await fetchMultiImages(urlString: "https://picsum.photos/1024", count: 12)
		}
		catch {
			print("Failed to fetch images: \(error)")
		}
		isLoading = false
	}
}

#Preview {
	MultiImageView()
}
