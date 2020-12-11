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
                DispatchQueue.main.async {
                   // self.list = employees
                    print("data in weather : \(data.name) ")
                   // self.tableView.reloadData()
                    
                    self.tv_desc.text = data.weather[0].main
                    self.tv_humidity.text = "\(data.main?.humidity ?? 0.0)"
                    self.tv_temp.text = "\(data.main?.temp ?? 0.0) ˚C"
                }
            }
        )
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
