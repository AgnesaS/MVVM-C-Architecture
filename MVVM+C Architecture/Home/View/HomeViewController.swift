//
//  HomeViewController.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 22.11.23.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController, Storyboarded{
    

    @IBOutlet weak var postTableView: UITableView!
    @IBOutlet weak var textLabel: UILabel!
    var viewModel: HomeViewModelProtocol?
    var coordinator: HomeCoordinator?
    var postResponse: Welcome?
    var request: PostRequests = PostRequests()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        if let email = viewModel?.email, let password = viewModel?.password {
            textLabel.text = "Hello \(email) - Your password is \(password)"
            // Do any additional setup after loading the view.
        }
        request.getPost { success in
            self.postResponse = success
            self.postTableView.reloadData()
        }
    }
    
    func setupTableView(){
        postTableView.dataSource = self
        postTableView.delegate = self
        postTableView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: PostCell.identifier)
    }

    @IBAction func backBtnTapped(_ sender: Any) {
        self.coordinator?.stop()
    }
}
extension HomeViewController: Coordinated {
    func getCoordinator() -> Coordinator? {
        return coordinator
    }
    func setCoordinator(_ coordinator: Coordinator) {
        self.coordinator = coordinator as? HomeCoordinator
    }
}
extension HomeViewController: UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postResponse?.days.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postTableView.dequeueReusableCell(withIdentifier: "PostCell")! as? PostCell
        cell?.postData = postResponse?.days[indexPath.row]
        return cell ?? UITableViewCell()
    }
}
