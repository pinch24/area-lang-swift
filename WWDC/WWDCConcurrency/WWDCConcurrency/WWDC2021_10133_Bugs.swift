//
//  WWDC2021_10133_Simple.swift
//  WWDCConcurrency
//
//  Created by mk on 12/18/23.
//

import SwiftUI

struct WWDC2021_10133_Bugs: View {
	var body: some View {
        Text("WWDC2021_10133_Simple")
			.task {
				refreshCounter()
			}
    }
	
	fileprivate let imageDownloader = ImageDownloader()
	fileprivate func refreshCounter() {
		let counter = Counter()
		for _ in 0...99 {
			Task.detached {
				try? await Task.sleep(for: .seconds(1))
				
				let count = await counter.increment()
				print("Counter: ", count)
				
				let imageUrl = "https://picsum.photos/\(4000)"
				guard let url = URL(string: imageUrl) else { return }
				guard let _ = try! await imageDownloader.image(from: url) else  { return }
			}
		}
	}
}

// MARK: - Counter
fileprivate actor Counter {
	var value = 0

	func increment() -> Int {
		value = value + 1
		return value
	}
}

// MARK: - Image Downloader
fileprivate actor ImageDownloader {
	var cache: [URL: Image] = [:]
	
	func image(from url: URL) async throws -> Image? {
		if let cached = cache[url] {
			return cached
		}
		// cache[url] = Image("xmark")
		
		let image = try await downloadImage(from: url)
		print("URL Image Response: ", url.description, cache.count)
		
		cache[url] = image
		return image
	}
	
	func downloadImage(from: URL) async throws -> Image {
		async let (data, _) = URLSession.shared.data(from: from)
		guard let uiImage = UIImage(data: try await data) else { throw ImageError.invalidImage }
		return Image(uiImage: uiImage)
	}
	
	enum ImageError: Error {
		case invalidURL
		case invalidImage
	}
}


#Preview {
	WWDC2021_10133_Bugs()
}
