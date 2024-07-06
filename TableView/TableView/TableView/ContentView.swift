//
//  ContentView.swift
//  TableView
//
//  Created by user937495 on 7/3/24.
//

import SwiftUI

struct ContentView: View {
    let cities = [
        City(name: "Auburn", state: "AL", population: 66502, areaSize: 59.2, county: "Lee"),
        City(name: "Atlanta", state: "GA", population: 498715, areaSize: 134.0, county: "Fulton"),
        City(name: "Chicago", state: "IL", population: 2716000, areaSize: 234.0, county: "Cook"),
        City(name: "New York", state: "NY", population: 8419000, areaSize: 468.9, county: "New York"),
        City(name: "Los Angeles", state: "CA", population: 3971000, areaSize: 503.0, county: "Los Angeles"),
        City(name: "Austin", state: "TX", population: 978908, areaSize: 326.5, county: "Travis"),
        City(name: "Tucson", state: "AZ", population: 542629, areaSize: 236.0, county: "Pima"),
        City(name: "Birmingham", state: "AL", population: 209880, areaSize: 148.6, county: "Jefferson"),
        City(name: "Denver", state: "CO", population: 727211, areaSize: 155.0, county: "Denver"),
        City(name: "Dallas", state: "TX", population: 1341075, areaSize: 340.9, county: "Dallas"),
        City(name: "Boston", state: "MA", population: 692600, areaSize: 89.6, county: "Suffolk")
    ]
    
    var body: some View {
        NavigationView {
            List(cities) { city in
                NavigationLink(destination: CityDetailView(city: city)) {
                    HStack {
                        Text(city.name)
                        Spacer()
                        Text(city.state)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Cities")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
