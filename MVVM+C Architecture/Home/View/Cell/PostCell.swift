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
     //   self.dateLabel.int = postData.temp
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
