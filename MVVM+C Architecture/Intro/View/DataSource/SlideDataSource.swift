//
//  SlideDataSource.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 21.11.23.
//

//import UIKit
//
//class SlideDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
//
//    var slides: [IntroModel] = []
//    
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//          return slides.count
//      }
//  
//      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlideCell.identifier, for: indexPath ) as! SlideCell
//          cell.setSlide(slides[indexPath.row])
//          return cell
//      }
//      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//          return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
//      }
//      func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//          let width = scrollView.frame.width
//        //  currentPage = Int(scrollView.contentOffset.x / width)
//      }
//}


