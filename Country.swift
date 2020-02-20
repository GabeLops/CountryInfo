//
//  Country.swift
//  project16
//
//  Created by Gabriel Lops on 2/11/20.
//  Copyright © 2020 Gabriel Lops. All rights reserved.
//



import Foundation


struct Country: Codable {
    var country: String
    var capital: String?
    var population: Int
    var languages: [[String: String]]
    var currency: String
    var area : Int
    var populationIncreasing: Bool
    
    enum CodingKeys: String, CodingKey {
        case country = "country"
        case capital = "capital"
        case population = "population"
        case languages = "languages"
        case currency = "currency"
        case area = "area (sq mi)"
        case populationIncreasing = "population increasing"
    }
}
