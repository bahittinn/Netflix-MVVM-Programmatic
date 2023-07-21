//
//  ViewController.swift
//  Netflix-MVVM-Programmatic
//
//  Created by Bahittin on 21.07.2023.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: HomeViewController())
        let vc3 = UINavigationController(rootViewController: HomeViewController())
        let vc4 = UINavigationController(rootViewController: HomeViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "gear")
        vc2.tabBarItem.image = UIImage(systemName: "gear")
        vc3.tabBarItem.image = UIImage(systemName: "gear")
        vc4.tabBarItem.image = UIImage(systemName: "gear")
        
        vc1.title = "anasayfa"
        vc2.title = "anasayfa2"
        vc3.title = "anasayfa3"
        vc4.title = "anasayfa4"
        
        
        setViewControllers([vc1,vc2,vc3,vc4], animated: true)
    }


}

