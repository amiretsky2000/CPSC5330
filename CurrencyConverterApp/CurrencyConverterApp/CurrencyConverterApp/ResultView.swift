//
//  ResultView.swift
//  CurrencyConverterApp
//
//  Created by user937495 on 6/29/24.
//

import Foundation
import SwiftUI

struct ResultView: View {
    @Binding var amountInUSD: String
    @Binding var selectedCurrencies: [Bool]
    @Binding var currencySelections: [Int]
    
    let currencies = ["EUR", "CAD", "JPY", "GBP"]
    let conversionRates: [Double] = [0.85, 1.25, 109.60, 0.75] // example conversion rates
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Amount in USD: \(amountInUSD)")
                .font(.title)
                .foregroundColor(.red)
                .padding(.bottom, 20)

            if let amount = Double(amountInUSD) {
                ForEach(0..<4) { index in
                    if selectedCurrencies[index] {
                        HStack {
                            Text("\(currencies[currencySelections[index]])")
                            Spacer()
                            Text("\(String(format: "%.2f", amount * conversionRates[currencySelections[index]]))")
                                .foregroundColor(.red)
                        }
                        .padding(.vertical, 5)
                    }
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Converted Amounts")
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(amountInUSD: .constant("100"), selectedCurrencies: .constant([true, true, true, false]), currencySelections: .constant([0, 1, 2, 3]))
    }
}
