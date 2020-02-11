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
        // Do any additional setup after loading the view.
    }
    override func tableView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countries.count

    }
    
    override func tableView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Image", for: indexPath) as? ImageCell
        
           
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.borderWidth = 2
        cell?.layer.cornerRadius = 3
        let picture = pictures[indexPath.item]
        cell?.name.text = (picture.name)
        return cell!
        
    }
        
    
    override func tableView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            let picture = pictures[indexPath.item]
            vc.selectedImage = picture.name
            picture.views += 1
            imageLoaded()
            vc.selectedPictureNumber = indexPath.item + 1
            vc.totalpictures = pictures.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}

