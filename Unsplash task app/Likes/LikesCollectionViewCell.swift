//
//  LikesCollectionViewCell.swift
//  Unsplash task app
//
//  Created by  Даниил on 31.01.2022.
//

import Foundation
import UIKit
import SDWebImage

class LikesCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "LikesCollectionViewCell"
    
    var myImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .green
        return imageView
    }()
    
    var unsplashPhoto: UnsplashPhoto! {
        didSet {
            let photoUrl = unsplashPhoto.urls["regular"] // спорный момент, лично для меня
            guard let imageUrl = photoUrl, let url = URL(string: imageUrl) else { return }
            myImageView.sd_setImage(with: url, completed: nil)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        backgroundColor = .green
        
        setupImageView()
    }
    
    func setupImageView() {
        addSubview(myImageView)
        myImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        myImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        myImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        myImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func set(photo: UnsplashPhoto) {
        let photoUrl = photo.urls["full"]
        guard let photoURL = photoUrl, let url = URL(string: photoURL) else { return }
        myImageView.sd_setImage(with: url, completed: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    private lazy var readMoreBarButtonItem: UIBarButtonItem = {
//       return UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(actionBarButtonTapped))
//    }()
//      здесь должен был быть action для кнопки, для показа большей информации, но я не успеваю разобраться в том, как это сделать
    //
    
}
//
