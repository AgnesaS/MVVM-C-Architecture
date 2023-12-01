//
//  WeatherDataSource.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 1.12.23.
//

import UIKit

class WeatherDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    var postResponse: Welcome?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Post:\(String(describing: postResponse?.days.count))")
        return postResponse?.days.count ?? 00
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as? WeatherCell
        if let weatherData = postResponse?.days[indexPath.row] {
            cell?.weatherData = weatherData
        }
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 149, height: 200)
    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let selectedData = postResponse?.days[indexPath.row] else { return }
//        coordinator?.showHomeInfo(model: [selectedData])
//       // print("Post response \(postResponse?.days[indexPath.row])")
//    }
}

