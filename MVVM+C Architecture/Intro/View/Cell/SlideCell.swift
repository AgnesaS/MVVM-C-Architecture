//
//  SlideCell.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 21.11.23.
//

import UIKit

class SlideCell: UICollectionViewCell {
    //MARK: IBOutlet
    @IBOutlet weak var slideImage: UIImageView!
    
    static let identifier = String(describing: SlideCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setSlide(_ slide: IntroModel){
        slideImage.image = slide.image
    }

}
