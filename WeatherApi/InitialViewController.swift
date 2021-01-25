//
//  InitialViewController.swift
//  WeatherApi
//
//  Created by Karan Gajjar on 12/3/20.
//

import UIKit


class InitialViewController: UITableViewController {

    @IBOutlet var btn_add: UIBarButtonItem!
    
    @IBOutlet var searchBar: UISearchBar!
        
    var myFetchResultsController = CoreDataManager.shared.myFetchResultsController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //fetchAllCity()
        tableView.delegate = self
        tableView.dataSource = self
        self.searchBar.delegate = self
        // Do any additional setup after loading the view.
        //self.tableView.register(initialTableViewCell.self, forCellReuseIdentifier: "cell")
        fetchAllCity()
    }
    
   override func numberOfSections(in tableView: UITableView) -> Int {
       // #warning Incomplete implementation, return the number of sections
       return myFetchResultsController.sections?.count ?? 0

   }

   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // #warning Incomplete implementation, return the number of rows
        return myFetchResultsController.sections?[section].numberOfObjects ?? 0
   }
  
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Clickecd on : \(indexPath.row)")
        let weatherViewController = storyboard?.instantiateViewController(identifier: "WeatherViewController") as? WeatherViewController
        weatherViewController?.city =
            myFetchResultsController.object(at: indexPath).cityName
       self.navigationController?.pushViewController(weatherViewController!, animated: true)
   }
   
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    print("loaded :\(indexPath)")
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! initialTableViewCell
    cell.setData(model: myFetchResultsController.object(at: indexPath))
    return cell
   }
   

   // Override to support editing the table view.
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       if editingStyle == .delete {
        print("\(myFetchResultsController.object(at: indexPath))")
          CoreDataManager.shared.deleteCity(city: myFetchResultsController.object(at: indexPath))
            fetchAllCity()
           
       }
   }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
          return 1
      }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
        fetchAllCity()
        
    }
    
    func fetchAllCity()
    {
        try? myFetchResultsController.performFetch()
        tableView.reloadData()
    }
    
}



extension InitialViewController : UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText == ""){
            try? myFetchResultsController.performFetch()
            tableView.reloadData()
        }
        else {
            //myFetchResultsController.fetchRequest = CoreDataManager.shared.search(text: searchText)
         tableView.reloadData()
        }
    }
    
}

//class InitialViewController: UITableViewController {
//
//    @IBOutlet var btn_add: UIBarButtonItem!
//
//    @IBOutlet var searchBar: UISearchBar!
//
//    var allCity : [CityDb] = [CityDb]()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        fetchAllCity()
//        self.searchBar.delegate = self
//        // Do any additional setup after loading the view.
//    }
//
//    func fetchAllCity()  {
//        allCity = CoreDataManager.shared.fetchCityFromCoreData()
//        tableView.reloadData()
//    }
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Clickecd on : \(allCity[indexPath.row])")
//        let weatherViewController = storyboard?.instantiateViewController(identifier: "WeatherViewController") as? WeatherViewController
//
//        weatherViewController?.city = (allCity[indexPath.row].cityName)
//
//       self.navigationController?.pushViewController(weatherViewController!, animated: true)
//
//   }
//   override func numberOfSections(in tableView: UITableView) -> Int {
//       // #warning Incomplete implementation, return the number of sections
//       return 1
//   }
//
//   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//       // #warning Incomplete implementation, return the number of rows
//       return allCity.count
//   }
//
//
//   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
//       cell.textLabel?.text = allCity[indexPath.row].cityName
//        cell.detailTextLabel?.text = allCity[indexPath.row].countryName
//       return cell
//   }
//
//   // Override to support conditional editing of the table view.
//   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//       // Return false if you do not want the specified item to be editable.
//       return true
//   }
//
//
//   // Override to support editing the table view.
//   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//       if editingStyle == .delete {
//
//           CoreDataManager.shared.deleteCity(city: allCity[indexPath.row])
//           fetchAllCity()
//
//       }
//   }
//
//    override func viewWillAppear(_ animated: Bool) {
//           super.viewWillAppear(animated)
//
//        fetchAllCity()
//        tableView.reloadData()
//
//    }
//}
//
//
//extension InitialViewController : UISearchBarDelegate{
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if (searchText == ""){
//            fetchAllCity()
//        }
//        else {
//        allCity = CoreDataManager.shared.search(text: searchText)
//         tableView.reloadData()
//        }
//    }
//
//}
