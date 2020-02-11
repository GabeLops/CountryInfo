//
//  Country.swift
//  project16
//
//  Created by Gabriel Lops on 2/11/20.
//  Copyright © 2020 Gabriel Lops. All rights reserved.
//



import UIKit

class Country: NSObject, Codable {
    var name = String()
    var views = Int()
    
    init(name: String, views: Int) {
        self.views = views
        self.name = name
    }

}
