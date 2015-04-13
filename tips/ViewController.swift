//
//  ViewController.swift
//  tips
//
//  Created by NL on 4/12/15.
//  Copyright (c) 2015 NL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        billField.clearsOnBeginEditing = true
        let tip = defaults.integerForKey("defaultTip")
        let billAmount = defaults.floatForKey("defaultBill")
        
        
        if tip >= 0
        {
            tipControl.selectedSegmentIndex = tip
        }
        
        if billAmount > 0
        {
            billField.text = String(format: "$%.2f", billAmount)
            updateTipHelper()
        }
        
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        updateTipHelper()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        tipControl.selectedSegmentIndex = defaults.integerForKey("defaultTip")
        updateTipHelper()
    }
    
    func updateTipHelper() {
        var tipPercentages = [0.18, 0.20, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        defaults.setObject(billAmount, forKey: "defaultBill")
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onEditingBillStart(sender: AnyObject) {
    }

}

