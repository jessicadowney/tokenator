//
//  setCost.swift
//  tokenator
//
//  Created by Jessica Downey on 29/07/15.
//  Copyright (c) 2015 jessica downey. All rights reserved.
//

import Foundation
import UIKit



class setCost: UIViewController  {
    @IBOutlet var tokenAmount: UITextField!
    @IBOutlet var bulkPrice: UITextField!
    @IBOutlet var tokenCurrency: UITextField!
    @IBOutlet var tokenPrice: UILabel!
    @IBOutlet var savePrice: UIButton!
    @IBOutlet weak var tokenCost: UITextField!
    
    var currentDetailView: UIViewController!
    
    //var tokenCost: Float? 
    var realAmount: Double = 10.00
    var realPrice: Double = 27.00


    @IBAction func tapSave(sender: AnyObject) {
        
        
        realAmount = (tokenAmount.text! as NSString).doubleValue;
        realPrice = (bulkPrice.text! as NSString).doubleValue;
        GlobalVar = realPrice / realAmount;
        
        tokenPrice.text = String(format: "%.2f", GlobalVar)+" €";
        
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults() //This class     variable needs to be defined every class where you set or fetch values from NSUserDefaults
        defaults.setObject(GlobalVar, forKey: "tokenValue")
        defaults.setObject(realAmount, forKey: "tokenAmount")
        defaults.setObject(realPrice, forKey: "tokenPrice")
        defaults.synchronize()
        
        
    }
    

    
    //Calls this function when the tap is recognized.
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Looks for single or multiple taps.
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults() //This class     variable needs to be defined every class where you set or fetch values from NSUserDefaults


        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    
}

