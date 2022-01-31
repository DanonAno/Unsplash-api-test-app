//
//  MainTabBarViewController.swift
//  Unsplash task app
//
//  Created by  Даниил on 30.01.2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        
        let photosVc = PhotosCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        
        let favorite = LikesCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        
        viewControllers = [
          generateNaviganionController(rootViewController: photosVc,
                                       title: "Unsplash Photos",
                                       image:  #imageLiteral(resourceName: "home1")),
          generateNaviganionController(rootViewController: favorite,
                                       title: "Favorite photos",
                                       image:  #imageLiteral(resourceName: "saved"))
        ]
        
      }
    private func generateNaviganionController(rootViewController:UIViewController, title: String, image: UIImage ) -> UIViewController {
        
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
    
    
    
}
