//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Tip Buttons
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var fifteenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    
    // Total bill amount
    @IBOutlet weak var billTotal: UITextField!
    
    // Split Amounts
    @IBOutlet weak var splitAmount: UILabel!
    
    var tip: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipAmountPressed(_ sender: UIButton) {
        sender.isSelected = true
        let tipWithoutPercent = sender.currentTitle?.replacingOccurrences(of: "%", with: "")
        let decimalTip: Float = Float((Double(tipWithoutPercent ?? "0") ?? 0.0) / 100.00)
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
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
    }
    
}

