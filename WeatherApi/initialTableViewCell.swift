//
//  initialTableViewCell.swift
//  WeatherApi
//
//  Created by Karan Gajjar on 12/18/20.
//

import UIKit

class initialTableViewCell: UITableViewCell {

    @IBOutlet var txt_title: UILabel!
    @IBOutlet var txt_subtitle: UILabel!

    
    func setData(model : CityDb){
        txt_title.text = model.cityName
        txt_subtitle.text = model.countryName
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//      
//    }

}
