//
//  WeatherViewController.swift
//  WeatherApi
//
//  Created by Karan Gajjar on 12/4/20.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var city : String?

    @IBOutlet var tv_desc: UILabel!
    
    @IBOutlet var tv_humidity: UILabel!
    
    @IBOutlet var tv_temp: UILabel!
    
    @IBOutlet var img_icon: UIImageView!
    
    @IBOutlet var feels_like: UILabel!
    
    var imgUrl=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = city
        fetchWeatherData()
        // Do any additional setup after loading the view.
    }
    
    func fetchWeatherData(){
            let manager = WeatherService()
        manager.fetchWeatherData(city: city ?? "", completionHandler: {
                (data) in
            DispatchQueue.main.async { [self] in
                   // self.list = employees
                    print("data in weather : \(data.name) ")
                   // self.tableView.reloadData()
                    
                    self.tv_desc.text = data.weather[0].main
                    self.tv_humidity.text = "\(data.main?.humidity ?? 0.0)"
                    self.tv_temp.text = "\(data.main?.temp ?? 0.0) ˚C"
                    self.feels_like.text = "\(data.main?.feelsLike ?? 0.0) ˚C"
                    let icon = data.weather[0].icon
                    self.imgUrl = "https://openweathermap.org/img/wn/\(icon).png"
                    //loadIcon(img:imgUrl)
                    img_icon.imageFromServerURL(urlString: imgUrl)
                }
            }
        )
    }

}
extension UIImageView {
    public func imageFromServerURL(urlString: String) {
        self.image = nil
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in

            if error != nil {
                print(error)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })

        }).resume()
    }}
