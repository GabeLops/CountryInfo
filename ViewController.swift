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

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Country Info "
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return countries.count

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let petition = countries[indexPath.row]
            cell.textLabel?.text = countries.title
            cell.detailTextLabel?.text = countries.body
            return cell
        }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vc = DetailedViewController()
            vc.detailedItem = countries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }

    }
