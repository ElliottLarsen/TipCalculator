//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Elliott Larsen on 2/14/22.
//

import UIKit

extension String {
    var isNum: Bool {
        if (Int(self) != nil) || (Float(self) != nil){
            return true
        } else {
            return false
        }
    }
}

class MainViewController: UIViewController {
    
    var displayBillAmount: String = "0.0"
    var displayTipAmount: String = "0.0"
    var displayTotalAmount: String = "0.0"
    var displayPerPerson: String = "0.0"

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipPercentage: UISlider!
    @IBOutlet weak var splitByLabel: UILabel!
    @IBOutlet weak var splitBy: UISlider!
    @IBOutlet weak var currency: UILabel!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
          

        }
    
        @IBAction func tipPercentChanged(_ sender: UISlider) {
            let percent = String(format: "%.0f", sender.value)
            tipPercentLabel.text = "\(percent)%"
            //print(percent)
        }
        
        @IBAction func spliByChanged(_ sender: UISlider) {
            let people = String(format: "%.0f", sender.value)
            if (people == "1"){
                splitByLabel.text = "\(people) Person"
            } else {
                splitByLabel.text = "\(people) People"
            }
                    

            //print(people)
        }
        
        @IBAction func calculateButton(_ sender: UIButton) {
            
            let numOfPeople = String(format: "%.0f", splitBy.value)
            let tipPercent = String(format: "%.0f", tipPercentage.value)
            let people = Int(numOfPeople)
            let percent = Float(tipPercent)! * 0.01
            
            
            let billEntered = billAmountTextField.text!
            if billEntered.isNum {
                let billAmount = Float(billAmountTextField.text!)
                displayBillAmount = billAmountTextField.text!
                let workingTipAmount = billAmount! * percent
                let totalAmount = billAmount! + workingTipAmount
                displayTotalAmount = String(format: "%.2f", billAmount! + workingTipAmount)
                displayTipAmount = String(format: "%.2f", workingTipAmount)
                displayPerPerson = String(format: "%.2f", totalAmount / Float(people!))

                performSegue(withIdentifier: "toResult", sender: self)
            } else{
                currency.text = "Please enter a number."
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                    self.currency.text = "USD"
                }
            }
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toResult" {
                let destinationVC = segue.destination as! ResultsViewController
                destinationVC.billAmount = displayBillAmount
                destinationVC.tipAmount = displayTipAmount
                destinationVC.totalAmount = displayTotalAmount
                destinationVC.perPerson = displayPerPerson
                destinationVC.splitBy = String(format: "%.0f", splitBy.value)
            }
        }
        
    }


