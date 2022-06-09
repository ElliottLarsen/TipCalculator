//
//  ResultsViewController.swift
//  Tip Calculator
//
//  Created by Elliott Larsen on 6/3/22.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var billAmount: String?
    var tipAmount: String?
    var totalAmount: String?
    var perPerson: String?
    var splitBy: String?
    
    
    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var perPersonLabel: UILabel!
    @IBOutlet weak var roundingError: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        billAmountLabel.text = "$\(billAmount ?? "0.00")"
        tipAmountLabel.text = "$\(tipAmount ?? "0.00")"
        totalAmountLabel.text = "$\(totalAmount ?? "0.00")"
        perPersonLabel.text = "$\(perPerson ?? "0.00")"
        
        let billNum = Double(billAmount!)
        let people = Double(splitBy!)
        let personBill = Double(perPerson!)
        
        if (people! * personBill! < billNum!) {
            roundingError.text = "Rounding Error.  Please Add One Cent."
        }
    
     }
     
    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    

     /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */

 }
