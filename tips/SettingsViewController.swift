//
//  SettingsViewController.swift
//  tips
//
//  Created by NL on 4/12/15.
//  Copyright (c) 2015 NL. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipControl.selectedSegmentIndex = defaults.integerForKey("defaultTip")
    }
    
    @IBAction func onDefaultTipChanged(sender: AnyObject) {
        defaults.setObject(tipControl.selectedSegmentIndex, forKey: "defaultTip")
    }
}