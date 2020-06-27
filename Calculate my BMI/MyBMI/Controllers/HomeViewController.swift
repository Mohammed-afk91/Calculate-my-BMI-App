//
//  ViewController.swift
//  MyBMI
//
//  Created by Mohammed Abdalla on 19/05/2020.
//  Copyright © 2020 Mohammed Abdalla. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var calculations = Calculations()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func HeightSliderChange(_ sender: UISlider) {
        var height = String (format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    
    }
    
    @IBAction func WeightSliderChange(_ sender: UISlider) {
        var weight = String (format: "%.0f", sender.value)
        weightLabel.text = "\(weight)kg"
        
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculations.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "GettingResults", sender: self)
        
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultsViewController
        destinationVC.bmiValue = calculations.getBMIValue()
        destinationVC.advice = calculations.getAdvice()
        destinationVC.color = calculations.getColor()
       }
}

