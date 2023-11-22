//
//  HomeViewController.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 22.11.23.
//

import UIKit

class HomeViewController: UIViewController, Storyboarded {

    var viewModel: HomeViewModelProtocol?
    var coordinator: HomeCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeViewController: Coordinated {
    func getCoordinator() -> Coordinator? {
        return coordinator
    }
    func setCoordinator(_ coordinator: Coordinator) {
        self.coordinator = coordinator as? HomeCoordinator
    }
}
