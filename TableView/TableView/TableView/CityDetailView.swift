//
//  CityDetailView.swift
//  TableView
//
//  Created by user937495 on 7/3/24.
//

import Foundation
import SwiftUI

struct CityDetailView: View {
    var city: City
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(city.name)
                .font(.largeTitle)
                .padding(.bottom)
            
            HStack {
                Text("State:")
                    .fontWeight(.bold)
                Text(city.state)
            }
            
            HStack {
                Text("Population:")
                    .fontWeight(.bold)
                Text("\(city.population)")
            }
            
            HStack {
                Text("Area Size:")
                    .fontWeight(.bold)
                Text("\(city.areaSize) sq mi")
            }
            
            HStack {
                Text("County:")
                    .fontWeight(.bold)
                Text(city.county)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle(city.name)
    }
}

struct CityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CityDetailView(city: City(name: "New York", state: "NY", population: 8419000, areaSize: 468.9, county: "New York"))
    }
}
