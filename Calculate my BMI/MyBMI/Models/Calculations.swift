//
//  Calculations.swift
//  MyBMI
//
//  Created by Mohammed Abdalla on 31/05/2020.
//  Copyright © 2020 Mohammed Abdalla. All rights reserved.
//

import UIKit

struct Calculations {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let BMIRounded = String(format: "%.1f", bmi?.value ?? 0.0)
        return BMIRounded
    }
    
    mutating func calculateBMI (height: Float, weight: Float) {
        let bmiValue = weight/pow(height, 2)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Underweight: Eat some Carbs!", color: #colorLiteral(red: 0.9248507619, green: 0.9095675945, blue: 0, alpha: 1))
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Healthy weight: Keep on rocking!", color: #colorLiteral(red: 0, green: 0.8724910617, blue: 0.2048698962, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "Overweight: Lose some weight!", color: #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1))
        }
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "no advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
}

