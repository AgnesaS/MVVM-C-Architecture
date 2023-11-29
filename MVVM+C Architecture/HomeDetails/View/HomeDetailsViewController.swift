//
//  HomeDetailsViewController.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 29.11.23.
//

import UIKit

class HomeDetailsViewController: UIViewController, Storyboarded {
//MARK: IBOutlets
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    
    
    var viewModel: HomeDetailsViewModelProtocol?
    var coordinator: HomeDetailsCoordinator?
    var request: PostRequests = PostRequests()
    var postResponse: Welcome?
    override func viewDidLoad() {
        super.viewDidLoad()

        request.getPost { success in
            self.postResponse = success
            self.fillData(weatherModel: self.postResponse)
        }
    }
    func fillData(weatherModel: Welcome?){
//        if let temp = weatherModel?.days.first?.temp {
//            self.firstLabel.text = String(" \(temp)°F")
//        } else {
//            // where temp is nil
//            self.firstLabel.text = "N/A"
//        }
//        self.secondLabel.text = weatherModel?.days.first?.datetime
//        print("FirstLabel \(String(describing: weatherModel?.days.first?.datetime))")
        if let temp = viewModel?.model.first?.temp {
            self.firstLabel.text = String(" \(temp)°F")
        } else {
            // where temp is nil
            self.firstLabel.text = "N/A"
        }
        self.secondLabel.text = viewModel?.model.first?.datetime
        print("FirstLabel \(String(describing: viewModel?.model.first?.datetime))")
    }
    @IBAction func backBtnTapped(_ sender: Any) {
        self.coordinator?.stop()
    }
    
}
extension HomeDetailsViewController: Coordinated {
    func getCoordinator() -> Coordinator? {
        return coordinator
    }
    func setCoordinator(_ coordinator: Coordinator) {
        self.coordinator = coordinator as? HomeDetailsCoordinator
    }
}
