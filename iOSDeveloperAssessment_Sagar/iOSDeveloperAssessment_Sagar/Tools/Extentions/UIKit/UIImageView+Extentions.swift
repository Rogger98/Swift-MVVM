//
//  UIImageView+Extentions.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import UIKit

let imageCache = NSCache<NSString, AnyObject>()


extension UIImageView {
    func loadImageFrom(url : String) {
        guard let imageUrl = URL(string: url) else { return  }
        if let imageFromCache = imageCache.object(forKey: url as NSString) as? UIImage {
            self.image = imageFromCache
            return
        }
        URLSession.shared.dataTask(with: imageUrl) { (image, response, error) in
            if error == nil,let imageData = image {
                if Thread.current.isMainThread {
                    self.image = UIImage(data: imageData)
                } else {
                    GCD.onMain {
                        self.image = UIImage(data: imageData)
                    }
                }
                imageCache.setObject(UIImage(data: imageData)!, forKey: url as NSString)
            }
        }.resume()
    }
}
