/// WWDC 2021 - Protect mutable state with Swift actors
/// https://developer.apple.com/videos/play/wwdc2021/10133/

//
//  WWDC2021_10133.swift
//  WWDCConcurrency
//
//  Created by mk on 12/15/23.
//
 
import SwiftUI

struct WWDC2021_10133: View {
	@State var count = 0
	
	@State var image: Image = Image(systemName: "rays")
	@State var imageUrl = ""
	@State var imageCount = 0
	fileprivate let imageDownloader = ImageDownloader()
	
	var body: some View {
		VStack {
			Text("Protect mutable state with Swift actors")
				.task { refreshCounter() }
			Text("Count: \(count)")
			Button("Refresh Counter") {
				refreshCounter()
			}
			
			image
				.resizable()
				.frame(width: 400, height: 400)
			Text(imageUrl)
			Text("Image Count: \(imageCount)")
		}
    }
	
	fileprivate func refreshCounter() {
		let counter = Counter()
		for _ in 0...99 {
			Task.detached {
				// Set Count
				let count = await counter.increment()
				self.count = count
				print("Counter: ", count)
				
				// Set Image
				self.imageUrl = "https://picsum.photos/\(4000)"
				guard let url = URL(string: imageUrl) else { return }
				guard let image = try! await imageDownloader.image(from: url) else  { return }
				self.image = image
				self.imageCount = await imageDownloader.cache.count
			}
		}
	}
}

fileprivate actor Counter {
	var value = 0
	
	func increment() -> Int {
		value = value + 1
		return value
	}
}

fileprivate actor ImageDownloader {
	// MARK: - Image Cache
	enum CacheEntry {
		case inProgress(Task<Image, Error>)
		case ready(Image)
	}
	var cache: [URL: CacheEntry] = [:]
	
	// MARK: - Image Downloader
	func image(from url: URL) async throws -> Image? {
		if let cached = cache[url] {
			switch cached {
			case .ready(let image):
				return image
			case .inProgress(let task):
				return try await task.value
			}
		}
		
		let task = Task {
			try await downloadImage(from: url)
		}
		print("URL Image Response: ", url.description, cache.count)
		
		cache[url] = .inProgress(task)
		
		do {
			let image = try await task.value
			cache[url] = .ready(image)
			return image
		}
		catch {
			cache[url] = nil
			throw error
		}
	}
	
	// MARK: - Download Image
	private enum ImageError: Error {
		case invalidURL
		case invalidImage
		case noImageData
		case unableToCreateThumbnail
	}
	func downloadImage(from: URL) async throws -> Image {
		async let (data, _) = URLSession.shared.data(from: from)
		guard let uiImage = UIImage(data: try await data) else { throw ImageError.invalidImage }
		return Image(uiImage: uiImage)
	}
}

#Preview {
    WWDC2021_10133()
}
