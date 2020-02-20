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
        
        
         if let data = loadJson(filename: "countries") {
                  countries = data
              } else {
                  print("Failed to load data.")
              }
        }
    func loadJson(filename fileName: String) -> [Country]? {
            if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode(Countries.self, from: data)
                    return jsonData.info
                } catch {
                    print("error:\(error)")
                }
            }
            return nil
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return countries.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "country", for: indexPath)
            let country = countries[indexPath.row]
            cell.textLabel?.text = country.country
            return cell
        }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vc = DetailedViewController()
            vc.detailItem = countries[indexPath.row]
            vc.countryName = countries[indexPath.row].country.uppercased()
            navigationController?.pushViewController(vc, animated: true)
        }

    }
