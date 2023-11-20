//
//  BaseNavigationController.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 18.11.23.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isHidden = true
    }
}
