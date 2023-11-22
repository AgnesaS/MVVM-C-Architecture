//
//  IntroViewController.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 16.11.23.
//

import UIKit

class IntroViewController: UIViewController, Storyboarded{

    //MARK: - Properties
    var viewModel: IntroViewModelProtocol?
    var slides : [IntroModel] = []
    var currentPage = 0{
        didSet{
            slidePageControl.currentPage = currentPage
        }
    }
   
    //MARK: - IBOutlets
    @IBOutlet weak var slideCollectionView: UICollectionView!
    @IBOutlet weak var slidePageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSlides()
        setupCollectionView()
       
    }
    func setSlides(){
        slides = [IntroModel(image: UIImage(named: "1")), IntroModel(image: UIImage(named: "2")), IntroModel(image: UIImage(named: "3"))]
        slidePageControl.numberOfPages = slides.count
        
    }
    func setupCollectionView(){

              slideCollectionView.dataSource = self
              slideCollectionView.delegate = self

              slideCollectionView.register(UINib(nibName: "SlideCell", bundle: nil), forCellWithReuseIdentifier: SlideCell.identifier)
    }
    
    //MARK: - IBActions
    @IBAction func loginTapped(_ sender: Any) {
        self.viewModel?.loginTapped()
      //  print("Login tapped")
    }
    @IBAction func signupTapped(_ sender: Any) {
        self.viewModel?.signupTapped()
    }
}

extension IntroViewController:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlideCell.identifier, for: indexPath ) as! SlideCell
        cell.setSlide(slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
