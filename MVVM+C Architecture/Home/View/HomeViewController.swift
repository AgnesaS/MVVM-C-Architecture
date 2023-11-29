//
//  HomeViewController.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 22.11.23.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController, Storyboarded{
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var postTableView: UITableView!
    
    var viewModel: HomeViewModelProtocol?
    var coordinator: HomeCoordinator?
    var postResponse: Welcome?
   // var request: PostRequests = PostRequests()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
       
            // Do any additional setup after loading the view.
       getPost { success in
            self.postResponse = success
            self.fillData(weatherDatas: self.postResponse)
            self.postTableView.reloadData()
            self.collectionView.reloadData()
        }
    }
    
    func setupTableView(){
        postTableView.dataSource = self
        postTableView.delegate = self
        postTableView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: PostCell.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "WeatherCell", bundle: nil), forCellWithReuseIdentifier: WeatherCell.identifier)
    }
    func getPost(completionHandler: @escaping (Welcome) -> Void) {
        let urlString = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/Pristine%2CKosovo?unitGroup=us&key=TJ3LH33M9Q4KXBECA7U8QZ4J8&contentType=json"
        
        AF.request(urlString).response { response in
            guard let data = response.data else { return }
            do { let decoder = JSONDecoder()
                let responseResult = try decoder.decode(Welcome.self, from: data)
               
                completionHandler(responseResult)
               // print(responseResult)
//                print(responseResult.days.first?.datetime)
            }
            catch let error { print(error)  }
        }
    }
    func fillData(weatherDatas: Welcome?){
     
        guard let firstLabel = weatherDatas?.days.first?.temp else {return}
        self.tempLabel.text = String(describing: firstLabel) + "°F"
        print("label: \(weatherDatas?.days.first?.temp)")
    
        //                }
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
    }
    
}
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Post:\(String(describing: postResponse?.days.count))")
        return postResponse?.days.count ?? 00
      
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as? WeatherCell
        cell?.weatherData = postResponse?.days[indexPath.row]
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 149, height: 200)
    }
    
    
}
