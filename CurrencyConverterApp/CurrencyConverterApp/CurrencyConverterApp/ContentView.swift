//
//  ContentView.swift
//  CurrencyConverterApp
//
//  Created by user937495 on 6/29/24.
//

import SwiftUI

struct ContentView: View {
    @State private var amountInUSD: String = ""
    @State private var showError: Bool = false
    @State private var showResultView: Bool = false
    @State private var selectedCurrencies: [Bool] = [true, true, true, false]
    @State private var currencySelections: [Int] = [0, 1, 2, 3]
    
    let currencies = ["EUR", "CAD", "JPY", "GBP"]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Enter USD:")
                    .font(.headline)
                    .padding(.top, 50)
                TextField("Enter amount", text: $amountInUSD)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(5)
                    .keyboardType(.numberPad)
                    .onChange(of: amountInUSD, perform: { value in
                        if Int(value) == nil && !value.isEmpty {
                            showError = true
                        } else {
                            showError = false
                        }
                    })

                if showError {
                    Text("Please enter a valid integer.")
                        .foregroundColor(.red)
                        .padding(.top, 5)
                }

                ForEach(0..<4) { index in
                    HStack {
                        Toggle("Currency \(index + 1)", isOn: $selectedCurrencies[index])
                        Picker("Select Currency", selection: $currencySelections[index]) {
                            ForEach(0..<currencies.count) { currencyIndex in
                                Text(currencies[currencyIndex]).tag(currencyIndex)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    .padding(.top, 10)
                }

                NavigationLink(destination: ResultView(amountInUSD: $amountInUSD, selectedCurrencies: $selectedCurrencies, currencySelections: $currencySelections), isActive: $showResultView) {
                    Button(action: {
                        if !showError && !amountInUSD.isEmpty {
                            showResultView = true
                        }
                    }) {
                        Text("CONVERT")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.top, 30)
                    }
                }
                .disabled(showError || amountInUSD.isEmpty)

                Spacer()
            }
            .padding()
            .navigationTitle("CurrencyConverter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
