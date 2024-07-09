//
//  ContentView.swift
//  BMICalculator
//
//  Created by user937495 on 7/6/24.
//

import SwiftUI


struct ContentView: View {
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var selectedUnit = "Metric"
    @State private var bmi: String = ""
    @State private var bmiCategory: String = ""
    
    let units = ["Metric", "Imperial"]
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Select Unit", selection: $selectedUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                TextField("Height (\(selectedUnit == "Metric" ? "cm" : "in"))", text: $height)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                
                TextField("Weight (\(selectedUnit == "Metric" ? "kg" : "lb"))", text: $weight)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                
                Button(action: calculateBMI) {
                    Text("Calculate BMI")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                
                Button(action: resetInputs) {
                    Text("Reset")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                
                if !bmi.isEmpty {
                    Text("BMI: \(bmi)")
                        .padding()
                    Text("Category: \(bmiCategory)")
                        .padding()
                }
                
                Spacer()
            }
            .navigationTitle("BMI Calculator")
            .padding()
        }
    }
    
    func calculateBMI() {
        guard let heightValue = Double(height), let weightValue = Double(weight) else {
            return
        }
        
        var bmiValue: Double = 0
        
        if selectedUnit == "Metric" {
            bmiValue = weightValue / (heightValue / 100 * heightValue / 100)
        } else {
            bmiValue = (weightValue / (heightValue * heightValue)) * 703
        }
        
        bmi = String(format: "%.2f", bmiValue)
        bmiCategory = getBMICategory(bmiValue)
    }
    
    func resetInputs() {
        height = ""
        weight = ""
        bmi = ""
        bmiCategory = ""
    }
    
    func getBMICategory(_ bmi: Double) -> String {
        switch bmi {
        case ..<18.5:
            return "Underweight"
        case 18.5..<24.9:
            return "Normal weight"
        case 25..<29.9:
            return "Overweight"
        default:
            return "Obesity"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
