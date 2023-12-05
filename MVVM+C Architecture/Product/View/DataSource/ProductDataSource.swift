//
//  ProductDataSource.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 5.12.23.
//

import UIKit

class ProductDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    var productResponse: Products?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Product count:\(String(describing: productResponse?.products.count))")
        return productResponse?.products.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell
        if let productData = productResponse?.products[indexPath.row]{
            cell?.productData = productData
        }
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 149, height: 200)
    }
}

