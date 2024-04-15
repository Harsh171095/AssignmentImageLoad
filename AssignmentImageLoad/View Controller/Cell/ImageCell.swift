//
//  ImageCell.swift
//  AssignmentImageLoad
//
//  Created by admin on 14/04/24.
//

import UIKit

class ImageCell: UICollectionViewCell {

    @IBOutlet private weak var imgPost: UIImageView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var btnReload: UIButton!
    @IBOutlet private weak var constHeight: NSLayoutConstraint!
    
    private var imageURL = ""
    private var height: CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func loadImage(image url: String, height: CGFloat) {
        imageURL = url
        self.height = height
        constHeight.constant = height
        
        btnReload.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        imgPost.image = UIImage()
        imgPost.contentMode = .scaleAspectFill
        LoadImageCache.inatance.loadImage(from: url) {[weak self] image in
            self?.activityIndicator.stopAnimating()
            self?.activityIndicator.isHidden = true
            if let image = image {
                self?.imgPost.image = image
                self?.btnReload.isHidden = true
            } else {
                self?.imgPost.image = UIImage(named: "picture_loading_failed")
                self?.btnReload.isHidden = false
            }
        }
        btnReload.addTarget(self, action: #selector(clickOn_reaload), for: .touchUpInside)
    }
    
    
    @objc private func clickOn_reaload() {
        loadImage(image: imageURL, height: self.height)
    }
}
