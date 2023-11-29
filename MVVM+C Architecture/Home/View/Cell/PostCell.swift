//
//  PostCell.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 22.11.23.
//

import Foundation
import UIKit

class PostCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var postData: CurrentConditions!{
        didSet{
            setDatas()
        }
    }
    
    static let identifier = String(describing: PostCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setDatas(){
        self.timeLabel.text = postData.datetime
        self.dateLabel.text = String("\(postData.temp) °F")
       // print("Datatime:\(postData.datetime)")
    
    }
    override func layoutSubviews() {
         super.layoutSubviews()
         let bottomSpace: CGFloat = 10.0 // Let's assume the space you want is 10
         self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: bottomSpace, right: 0))
    }
}
