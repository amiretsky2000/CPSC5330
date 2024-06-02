import Foundation
func Payment(loan: Int, num_payments: Int, interest_rate: Float) -> Float {
    let factor = pow(1 + Float(interest_rate), Float(num_payments))
    return Float(loan) * (interest_rate * factor) / (factor - 1)

}

let rate1 = Float(4.4) / 12.0
let payment1 = Payment(loan: 20000, num_payments: 2, interest_rate: rate1 * 0.01)
print(String(format: "$%.2f", payment1))




let rate2 = Float(5.0)
let payment2 = Payment(loan: 150000, num_payments: 30, interest_rate: rate2 * 0.01)
print(String(format: "$%.2f", payment2))
