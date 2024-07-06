//
//  City.swift
//  TableView
//
//  Created by user937495 on 7/3/24.
//

import Foundation

struct City: Identifiable {
    var id = UUID()
    var name: String
    var state: String
    var population: Int
    var areaSize: Double // in square miles
    var county: String
}
