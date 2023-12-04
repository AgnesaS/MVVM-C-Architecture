//
//  SplashViewController.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 20.11.23.
//
import UIKit

class SplashViewController: UIViewController, Storyboarded{
    //MARK: - Properties
    var viewModel: SplashViewModelProtocol?
    var timer: Timer?
    var time = 0.0
    var loaderDuration = 2.0
    //MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    //MARK: - Functions
    @objc func update(){
        time += 1
        if time == loaderDuration{
            splashAppear()
        }
    }
    func splashAppear(){
        self.viewModel?.splashShown()
    }
    
    func checkToken(){
        let defaults = UserDefaults.standard
        if defaults.bool(forKey: "FirstLaunch") == true {
            let token = Defaults.string(forKey: USER_TOKEN)
            if token != "" && token != nil{
              //  self.viewModel?.goToMain()
            }
            else {
                self.viewModel?.splashShown()
            }
        }
    }
    
}
