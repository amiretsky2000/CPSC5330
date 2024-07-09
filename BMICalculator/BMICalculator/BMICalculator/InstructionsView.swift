//
//  InstructionsView.swift
//  BMICalculator
//
//  Created by user937495 on 7/7/24.
//

import Foundation
import SwiftUI

struct InstructionsView: View {
    var body: some View {
        VStack {
            Text("Instructions")
                .font(.largeTitle)
                .padding()
            
            Text("1. Select the unit (Metric/Imperial).")
            Text("2. Enter your height and weight.")
            Text("3. Tap 'Calculate BMI' to see your BMI and category.")
            Text("4. Tap 'Reset' to clear inputs.")
            
            Spacer()
        }
        .padding()
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView()
    }
}
