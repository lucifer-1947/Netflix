//
//  ViewController.swift
//  Netflix
//
//  Created by Raj Guggilla on 07/02/24.
//

import UIKit

class MenuTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
        
        netflixNavigation()
        
    }


    private func netflixNavigation(){
        
        let tabHome = HomeViewController()
        let tabUpcoming = UpcomingViewController()
        let tabSearch = SearchViewController()
        let tabDownloads = DownloadsViewController()
        
        tabHome.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.circle"), selectedImage: UIImage(systemName: "house.circle.fill"))
        
        tabUpcoming.tabBarItem = UITabBarItem(title: "Coming Soon", image: UIImage(systemName: "play.circle"), selectedImage: UIImage(systemName: "play.circle.fill"))
        
        tabSearch.tabBarItem = UITabBarItem(title: "Top Search", image: UIImage(systemName: "magnifyingglass.circle"), selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"))
        
        tabDownloads.tabBarItem = UITabBarItem(title: "Downloads", image: UIImage(systemName: "arrow.down.circle"), selectedImage: UIImage(systemName: "arrow.down.circle.fill"))
        
        
        tabBar.tintColor = .label
        
//        viewControllers = [tabHome,tabUpcoming,tabSearch,tabDownloads]
        setViewControllers( [tabHome,tabUpcoming,tabSearch,tabDownloads], animated: true)
    }
}

