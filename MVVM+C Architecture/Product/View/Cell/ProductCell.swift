//
//  ProductCell.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 5.12.23.
//

import UIKit
import Kingfisher

class ProductCell: UICollectionViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    var productData: Product!{
        didSet{
            setProduct()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static let identifier = String(describing: ProductCell.self)
    func setProduct(){
        self.productTitle.text = productData.title
        self.productPrice.text = String("\(productData.price)")
        setImage(images: productData.images)
    }
    func setImage(images: [String]){
        if let image = images.first{
            let url = URL(string: image)
            self.productImage.kf.setImage(with: url)
        }
    }

}
