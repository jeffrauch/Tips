//
//  ViewController.swift
//  Tips
//
//  Created by Jeff Rauch on 11/19/15.
//  Copyright © 2015 Jeff Rauch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var twoPeople: UILabel!
    @IBOutlet weak var threePeople: UILabel!
    @IBOutlet weak var fourPeople: UILabel!
    @IBOutlet weak var blueBg: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        billField.becomeFirstResponder()
        
        billField.text = ""
        tipLabel.text = "$0.00"
        
        // Movement
        self.billField.transform = CGAffineTransformMakeTranslation(0,100)
        self.billLabel.transform = CGAffineTransformMakeTranslation(0,100)
        self.blueBg.transform = CGAffineTransformMakeTranslation(0,1000)
        self.totalLabel.transform = CGAffineTransformMakeTranslation(0,1000)
        self.tipControl.transform = CGAffineTransformMakeTranslation(0,1000)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        if billField.text == "" {
            
            UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 0.05, options: [], animations: {
            
                // Movement
                self.billField.transform = CGAffineTransformMakeTranslation(0,100)
                self.billLabel.transform = CGAffineTransformMakeTranslation(0,100)
                self.blueBg.transform = CGAffineTransformMakeTranslation(0,1000)
                self.totalLabel.transform = CGAffineTransformMakeTranslation(0,1000)
                self.tipControl.transform = CGAffineTransformMakeTranslation(0,1000)
                
            } , completion: nil)
        
        }
        
        else {
        
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 0.05, options: [], animations: {
            
            // Movement
            self.billField.transform = CGAffineTransformMakeTranslation(0,0)
            self.billLabel.transform = CGAffineTransformMakeTranslation(0,0)
            self.blueBg.transform = CGAffineTransformMakeTranslation(0,0)
            self.totalLabel.transform = CGAffineTransformMakeTranslation(0,0)
            self.tipControl.transform = CGAffineTransformMakeTranslation(0,0)
            
            } , completion: nil)
            
        }
        
        var tipPercentages = [0.18, 0.20, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        twoPeople.text = String(format: "$%.2f", total / 2)
        threePeople.text = String(format: "$%.2f", total / 3)
        fourPeople.text = String(format: "$%.2f", total / 4)
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        
    }
}

