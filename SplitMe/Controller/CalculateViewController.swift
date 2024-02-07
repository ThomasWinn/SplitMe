//
//  CalculateViewController.swift
//  SplitMe
//
//  Created by Thomas Nguyen on 02/07/2024.
//  Copyright © 2024 ThomasWinn. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    // Tip Buttons
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var fifteenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    var tipPercent: String = "-1%"
    
    // Total bill amount
    @IBOutlet weak var billTotal: UITextField!
    
    // Split Amounts
    @IBOutlet weak var splitAmount: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    var tip: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stepper.stepValue = 1.0
        splitAmount.text = Int(stepper.value).description
        billTotal.placeholder = "0.00"
    }
    
    @IBAction func tipAmountPressed(_ sender: UIButton) {
        sender.isSelected = true
        tipPercent = sender.currentTitle!
        print(tipPercent)
        let tipWithoutPercent = sender.currentTitle?.replacingOccurrences(of: "%", with: "")
        let decimalTip: Double = (Double(tipWithoutPercent ?? "0") ?? 0.0) / 100.00
        tip = decimalTip
        
        if sender != zeroButton {
            zeroButton.isSelected = false
        }
        if sender != tenButton {
            tenButton.isSelected = false
        }
        if sender != fifteenButton {
            fifteenButton.isSelected = false
        }
        if sender != twentyButton {
            twentyButton.isSelected = false
        }
    }
    
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        splitAmount.text = Int(sender.value).description
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "mySegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue" {
            let destinationVC = segue.destination as! ResultViewController
            
            // Tip Calculation
            let doubleBillTotal: Double = Double(billTotal.text!)!
            let eachTotal: Double = (doubleBillTotal + (doubleBillTotal * tip)) / stepper.value
            destinationVC.dollarAmount = "$" + String(format: "%.2f", eachTotal)
            
            print("$" + String(format: "%.2f", eachTotal))
            // Summary Label
            destinationVC.summary = "Split between \(String(format: "%.0f", stepper.value)) people, with \(tipPercent) tip."
        }
    }
}

