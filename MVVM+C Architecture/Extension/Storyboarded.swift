//
//  Storyboarded.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 18.11.23.
//

import UIKit
protocol Storyboarded {
    static func instantiate(_ storyboard: UIStoryboard) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(_ storyboard: UIStoryboard) -> Self {
        return storyboard.instantiateViewController(withIdentifier: String(describing: Self.self)) as! Self
    }
}

extension UIStoryboard {
    static var splash: UIStoryboard {
        return UIStoryboard(name: "Splash", bundle: nil)
    }
    static var intro: UIStoryboard {
        return UIStoryboard(name: "Intro", bundle: nil)
    }
    static var login: UIStoryboard {
        return UIStoryboard(name: "Login", bundle: nil)
    }
    static var signup: UIStoryboard {
        return UIStoryboard(name: "Signup", bundle: nil)
    }
    static var home: UIStoryboard {
        return UIStoryboard(name: "Home", bundle: nil)
    }
    static var tabBar: UIStoryboard {
        return UIStoryboard(name: "TabBar", bundle: nil)
    }
    static var product: UIStoryboard {
        return UIStoryboard(name: "Product", bundle: nil)
    }
    static var homeDetails: UIStoryboard {
        return UIStoryboard(name: "HomeDetails", bundle: nil)
    }
  

 
}

extension UIStoryboard {
    func instantiate<T: UIViewController>(_ : T.Type, identifier: String? = nil) -> T {
        return self.instantiateViewController(withIdentifier: identifier ?? String(describing: T.self)) as! T
    }
}

