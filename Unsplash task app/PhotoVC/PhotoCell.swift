//
//  PhotoCell.swift
//  Unsplash task app
//
//  Created by  Даниил on 31.01.2022.
//

import UIKit
import SDWebImage

class PhotoCell: UICollectionViewCell {
    
    static let reuseId = "PhotosCell"
    
    private let checkMark: UIImageView = {
        let image = #imageLiteral(resourceName: "accept")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0
        return imageView
        
    }()
    
    
    
    var unsplashPhoto: UnsplashPhoto! {
        didSet {
            let photoUrl = unsplashPhoto.urls["regular"]
            guard let imageUrl = photoUrl, let url = URL(string: imageUrl) else { return }
            photoImageView.sd_setImage(with: url, completed: nil)
            
        }
    }
    
    override var isSelected: Bool {
        didSet {
            updateSelectedState()
        }
    }
    
       let photoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        imageView.contentMode = .scaleAspectFill
        
        
        return imageView
    }()
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
        
    }
    
    private func updateSelectedState() {
        photoImageView.alpha = isSelected ? 0.7 : 1
        checkMark.alpha = isSelected ? 1 : 0
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPhotoImageView()
        setupCheckmarkView()
        updateSelectedState()
        
        
    }
    private func setupPhotoImageView() {
        addSubview(photoImageView)
        photoImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    }
    private func setupCheckmarkView() {
        addSubview(checkMark)
        checkMark.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: -8).isActive = true
        checkMark.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: -8).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//
