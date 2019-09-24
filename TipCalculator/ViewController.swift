//
//  ViewController.swift
//  TipCalculator
//
//  Created by Heebner, Jacob on 9/18/19.
//  Copyright © 2019 Heebner, Jacob. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTotal: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var endingTipAmount: UILabel!
    
    @IBOutlet weak var billAmount: UITextField!
    

    func calculate(tipPercent: Double) {
        if let tipAmount: Double = Double(billAmount.text!) {
            billAmount.resignFirstResponder()
            let unRounded = tipAmount * tipPercent
            let trailingZeros = NumberFormatter()
            trailingZeros.minimumFractionDigits = 2
            let rounded = round(unRounded * 100)/100
            let finalTip = trailingZeros.string(from: NSNumber(value: rounded))!
            endingTipAmount.text = "$\(finalTip)"
            //endingTipAmount.text = "$\(String(round(unRounded * 100)/100))"
        }
        else {
            billAmount.text = String()
            let alert = UIAlertController(title: "Please enter a valid bill amount.", message: "Bill amount should be entered as a double.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func fifteenPercentButton(_ sender: UIButton) {
        
        calculate(tipPercent: 0.15)
    }
    
    @IBAction func eighteenPercentButton(_ sender: UIButton) {
        
        calculate(tipPercent: 0.18)
    }
    
    @IBAction func twentyPercentButton(_ sender: UIButton) {
        
        calculate(tipPercent: 0.20)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}

