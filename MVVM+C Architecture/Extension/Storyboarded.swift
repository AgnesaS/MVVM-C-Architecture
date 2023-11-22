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
  

 
}

extension UIStoryboard {
    func instantiate<T: UIViewController>(_ : T.Type, identifier: String? = nil) -> T {
        return self.instantiateViewController(withIdentifier: identifier ?? String(describing: T.self)) as! T
    }
}

