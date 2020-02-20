//
//  ViewController.swift
//  project16
//
//  Created by Gabriel Lops on 2/6/20.
//  Copyright © 2020 Gabriel Lops. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var countries = [Country]()
    var multipleCountries = ["Brazil", "America", "Africa", "Mexico", "Japan", "China", "Thailand", "Peru", "Canada", "Indonesia"]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Country Info "
        let urlString: String
        
        if let url = URL(string: urlString){
        if let data = try? Data(contentsOf: url){
        parse(json: data)
            return
        }
    }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return countries.count

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let petition = countries[indexPath.row]
            cell.textLabel?.text = Country.title
            cell.detailTextLabel?.text = Country.body
            return cell
        }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vc = DetailedViewController()
            vc.detailedItem = countries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
        func parse(json: Data) {
            let decoder = JSONDecoder()
            
            if let jsonPetitions = try? decoder.decode(countries.self, from: json){
                countries = jsonPetitions.results
                tableView.reloadData()
            }
    }

    }
func showError (){
    let ac = UIAlertController(title: "Loading Error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
    ac.addAction(UIAlertAction(title: "ok", style: .default))
    present(ac, animated: true)
}

