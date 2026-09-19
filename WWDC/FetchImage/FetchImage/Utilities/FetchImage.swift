//
//  FetchImage.swift
//  SwiftActor
//
//  Created by mk on 12/12/23.
//

import UIKit

func fetchMultiImages(urlString: String, count: Int) async throws -> [String: UIImage] {
	print(getThreadInfo(), "\t\t\t\t", #function)
	
	var images: [String: UIImage] = [:]
	try await withThrowingTaskGroup(of: (String, UIImage).self) { group in
		for _ in 0 ..< count {
			group.addTask {
				let id = UUID().uuidString.prefix(4).description
				return (id, try await downloadImage(urlString: urlString, id: id, step: 1))
			}
		}
		for try await (id, image) in group {
			images[id] = image
		}
	}
	return images
}

func downloadImage(urlString: String, id: String, step: Int) async throws -> UIImage {
	print(getThreadInfo(), "\t\t\t\t", id, String(format: "%2d.1", step), #function)
	
	guard let url = URL(string: urlString) else { throw ImageError.invalidURL }
	
	async let (data, _) = URLSession.shared.data(from: url)
	print(getThreadInfo(), "\t\t\t\t", id, String(format: "%2d.2", step), #function, "Download Size: \(try await String(format: "\t %4d KB", data.count / 1024))")
	
	guard let image = try await UIImage(data: data)?.byPreparingThumbnail(ofSize: CGSize(width: 200, height: 200)) else { throw ImageError.noImageData }
	print(getThreadInfo(), "\t\t\t\t", id, String(format: "%2d.3", step), #function, "Resize: \(String(format: "\t\t\t %4d KB", (image.pngData()?.count ?? 0) / 1024))")
	
	return image
}

enum ImageError: Error {
	case invalidURL
	case noImageData
}
