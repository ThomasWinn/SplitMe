//
//  ResultViewController.swift
//  SplitMe
//
//  Created by Thomas Nguyen on 02/07/2024.
//  Copyright © 2024 ThomasWinn. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var dollarAmount: String?
    var summary: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = dollarAmount
        summaryLabel.text = summary
    }
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

}
