//
//  ProductViewController.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 4.12.23.
//

import UIKit
import Alamofire
import SwiftyJSON

class ProductViewController: UIViewController,Storyboarded {
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    var viewModel: ProductViewModelProtocol?
    var coordinator: ProductCoordinator?
    var productRequest: Products?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        getMethod { result in
            switch result {
            case .success(let products):
                // Handle the successful response with your 'Products' type
                print("GET Responseee: \(products)")
                self.productRequest = products
                DispatchQueue.main.async {
                    self.productCollectionView.reloadData()
                }
            case .failure(let error):
                // Handle the error
                print("Error: \(error)")
                
                // You may want to show an error message to the user or take other actions
            }
        }
    }
    func setupCollectionView(){
        productCollectionView.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: ProductCell.identifier)
        productCollectionView.dataSource = self.viewModel?.productDataSource
        productCollectionView.delegate = self.viewModel?.productDataSource
        
    }
    func getMethod(completion: @escaping (Result<Products, Error>) -> Void) {
        let urlString = "https://dummyjson.com/products"
        
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                if let data = data {
                    do {
                        // Parse the JSON response
                        let products = try JSONDecoder().decode(Products.self, from: data)
                        completion(.success(products))
                        self.productRequest = products
                        self.viewModel?.getProduct(product: self.productRequest!)
                        DispatchQueue.main.async {
                            self.productCollectionView.reloadData()
                        }
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
            
            task.resume()
        }
    }
    
}
extension ProductViewController: Coordinated {
    func getCoordinator() -> Coordinator? {
        return coordinator
    }
    func setCoordinator(_ coordinator: Coordinator) {
        self.coordinator = coordinator as? ProductCoordinator
    }
}
