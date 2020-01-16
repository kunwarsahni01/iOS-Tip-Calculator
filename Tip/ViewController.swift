//
//  ViewController.swift
//  Tip
//
//  Created by Kunwar Sahni on 1/15/20.
//  Copyright © 2020 purdue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var tipSelection: UISegmentedControl!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var peopleAmountLabel: UILabel!
    @IBOutlet weak var peopleStepper: UIStepper!
    @IBOutlet weak var totalImagePerson: UIImageView!
    
    @IBOutlet weak var totalPerPerson: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        totalImagePerson.isHidden = true
        totalPerPerson.isHidden = true
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmount.text!) ?? 0
        let peopleNum = peopleStepper.value
        peopleAmountLabel.text = String(Int(peopleNum))

        let tipPercantages = [0.15, 0.2, 0.25]
        let tip = bill * tipPercantages[tipSelection.selectedSegmentIndex]
        let total = bill + tip
        
        if(peopleNum > 1.0){
            let perPerson = total/peopleNum
            totalPerPerson.text = String(format:"$%.2f", perPerson)
            totalImagePerson.isHidden = false
            totalPerPerson.isHidden = false
        } else{
            totalImagePerson.isHidden = true
            totalPerPerson.isHidden = true
        }
        
        tipAmount.text = String(format:"$%.2f", tip)
        totalAmount.text = String(format:"$%.2f", total)

    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}

