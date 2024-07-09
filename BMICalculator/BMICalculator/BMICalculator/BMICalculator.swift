//
//  BMICalculator.swift
//  BMICalculator
//
//  Created by user937495 on 7/6/24.
//

import Foundation


class BMICalculator {
    static func calculateBMI(height: Double, weight: Double, unit: String) -> Double {
        if unit == "Metric" {
            return weight / (height / 100 * height / 100)
        } else {
            return (weight / (height * height)) * 703
        }
    }
    
    static func getBMICategory(bmi: Double) -> String {
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
