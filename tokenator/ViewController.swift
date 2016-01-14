//
//  ViewController.swift
//  tokenator
//
//  Created by Jessica Downey on 27/07/15.
//  Copyright (c) 2015 jessica downey. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    


    @IBOutlet var tokenPaid: UITextField!
    @IBOutlet var costPaid: UILabel!
    
    @IBAction func startAmountChange(sender: AnyObject) {
        tokenPaid.text=""

    }

    @IBAction func editingAmountFinished(sender: UITextField) {
        somethingEntered()
        view.endEditing(true)

    }
    
    @IBAction func amountChanged(sender: AnyObject) {
        somethingEntered()
    }
    
    //Calls this function when something has been entered
    func somethingEntered(){
        let enteredValue = (tokenPaid.text! as NSString).doubleValue;
        var realCost: Double;
        
        if enteredValue != 0{
            realCost = enteredValue * GlobalVar;
        }else{
            realCost = 0;
        }
        
        costPaid.text = realCost.description+" €"
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
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        GlobalVar  = (defaults.valueForKey("tokenValue") as? Double)!
        
        let firstLaunch = NSUserDefaults.standardUserDefaults().boolForKey("FirstLaunch")
        if firstLaunch  {
            print("Not first launch.")
        }
        else {
            print("First launch, setting NSUserDefault.")
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "FirstLaunch")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

