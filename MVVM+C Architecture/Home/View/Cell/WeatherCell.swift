//
//  WeatherCell.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 28.11.23.
//

import UIKit

class WeatherCell: UICollectionViewCell {

    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    
    var weatherData: CurrentConditions!{
        didSet{
            setWeather()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static let identifier = String(describing: WeatherCell.self)
    
    func setWeather(){
        self.firstLabel.text = String(weatherData.datetime)
        self.secondLabel.text  = String("\(weatherData.temp) °F")
    }
}
