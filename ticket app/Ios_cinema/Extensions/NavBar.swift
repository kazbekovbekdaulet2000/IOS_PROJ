//
//  NavBar.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 20.12.2021.
//

import Foundation
import UIKit

class ViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundEffect = UIBlurEffect(style: .light)
        
        //        UINavigationBar.appearance().barTintColor = .clear
        //        UINavigationBar.appearance().isTranslucent = true
        //        UINavigationBar.appearance().isOpaque = true
        //        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        //        UINavigationBar.appearance().standardAppearance = appearance
        //        UINavigationBar.appearance().compactAppearance = appearance
        //        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barTintColor = .clear
        self.navigationController?.navigationBar.tintColor = .clear
        self.navigationController?.navigationBar.backgroundColor = UIColor(.gray)
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.compactAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
}
