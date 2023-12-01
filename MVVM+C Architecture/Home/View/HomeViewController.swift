//
//  HomeViewController.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 22.11.23.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeViewController: UIViewController, Storyboarded{
    //MARK: IBOutlets
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var postTableView: UITableView!
    
    //MARK: Proporties
    var viewModel: HomeViewModelProtocol?
    var coordinator: HomeCoordinator?
    var postResponse: Welcome?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getPost { success in
            self.postResponse = success
            self.fillData(weatherDatas: self.postResponse)
            self.collectionView.reloadData()
            self.postTableView.reloadData()
       
        }
    }
    //MARK: Functions
    func setupTableView(){
        postTableView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: PostCell.identifier)
        postTableView.dataSource = self.viewModel?.postDataSource
        postTableView.delegate = self.viewModel?.postDataSource
        
        collectionView.register(UINib(nibName: "WeatherCell", bundle: nil), forCellWithReuseIdentifier: WeatherCell.identifier)
        collectionView.dataSource = self.viewModel?.weatherDataSource
        collectionView.delegate = self.viewModel?.weatherDataSource
     
    }
    func getPost(completionHandler: @escaping (Welcome) -> Void) {
        let urlString = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/Pristine%2CKosovo?unitGroup=us&key=TJ3LH33M9Q4KXBECA7U8QZ4J8&contentType=json"
        
        AF.request(urlString).response { response in
            guard let data = response.data else { return }
            do { let decoder = JSONDecoder()
                let responseResult = try decoder.decode(Welcome.self, from: data)
                
                completionHandler(responseResult)
                self.postResponse = responseResult
                self.viewModel?.getWeather(weather: self.postResponse!)
                self.viewModel?.getPost(post: self.postResponse!)
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                DispatchQueue.main.async {
                    self.postTableView.reloadData()
                }
               // print(responseResult)
//                print(responseResult.days.first?.datetime)
            }
            catch let error { print(error)  }
        }
    }
    func fillData(weatherDatas: Welcome?){
        guard let firstLabel = weatherDatas?.days.first?.temp else {return}
        self.tempLabel.text = String(describing: firstLabel) + "°F"
        print("label: \(String(describing: weatherDatas?.days.first?.temp))")
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
       self.coordinator?.stop()
//        self.viewModel?.logOut()
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
