//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Elliott Larsen on 2/14/22.
//

import UIKit

class MainViewController: UIViewController {
    
    var billAmount: Float = 0.00
    var tipAmount: Float = 0.00
    var totalAmount: Float = 0.00
    var perPerson: Float = 0.00

    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipPercentage: UISlider!
    
    @IBOutlet weak var splitByLabel: UILabel!
    @IBOutlet weak var splitBy: UISlider!
    
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
        splitByLabel.text = "\(people) People"
        //print(people)
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        
        let numOfPeople = String(format: "%.0f", splitBy.value)
        let tipPercent = String(format: "%.0f", tipPercentage.value)
        let people = Int(numOfPeople)
        let percent = Float(tipPercent)! * 0.01
        
        
        
        let billAmount = Float(billAmountTextField.text!)
        let workingTipAmount = billAmount! * percent
        let totalAmount = billAmount! + workingTipAmount
        let tipAmount = String(format: "%.2f", workingTipAmount)
        let perPerson = String(format: "%.2f", totalAmount / Float(people!))
       
        

        
        
        print(billAmount!)
        print(tipAmount)
        print(totalAmount)
        print(perPerson)
        //tipAmount = billAmount * (Int(tipPercentage.value)/10)
        
        performSegue(withIdentifier: "toResult", sender: self)

    }
    
}

