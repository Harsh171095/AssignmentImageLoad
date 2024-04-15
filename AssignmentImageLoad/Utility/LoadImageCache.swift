//
//  LoadImageCache.swift
//  AssignmentImageLoad
//
//  Created by admin on 14/04/24.
//

import Foundation
import UIKit

class LoadImageCache {
    static let inatance = LoadImageCache()
    
    private let cacheData = NSCache<NSURL, UIImage>()
    
    func loadImage(from stringURL: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: stringURL) else {
            completion(nil)
            return
        }
        
        if let cachedImage = cacheData.object(forKey: url as NSURL) {
            completion(cachedImage)
            return
        }
        
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: url),
               let image = UIImage(data: imageData) {
                self.cacheData.setObject(image, forKey: url as NSURL)
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
    
}
