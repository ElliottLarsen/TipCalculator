//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Elliott Larsen on 2/14/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitByField: UITextField!
    @IBOutlet weak var perPersonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //@IBAction func calculateTip(_ sender: Any) {
        
        //let bill = Double(billAmountField.text!) ?? 0
        
        // Get Total tip by multiplying tip * tipPercentage
        //let tipPercentages = [0.15, 0.18, 0.20]
        //let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        //let total = bill + tip
        
        // Split the bill
        //let personCount = Int(splitByField.text!) ?? 0
        //let perPerson = Double(total) / Double(personCount)
        
    //}
    
    @IBAction func calculateButton(_ sender: Any) {
        let bill = Double(billAmountField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.20]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let personCount = Int(splitByField.text!) ?? 0
        let perPerson = Double(total) / Double(personCount)
    
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
        // Update the per person bill amount
        perPersonLabel.text = String(format: "$%.2f", perPerson)
    }
    

    
}

