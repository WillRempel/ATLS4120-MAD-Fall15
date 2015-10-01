//
//  ViewController.swift
//  bac_test
//
//  Created by Will Rempel on 9/29/15.
//  Copyright (c) 2015 Will Rempel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var drinkVolume: UITextField!
    @IBOutlet weak var alcoholContent: UITextField!
    @IBOutlet weak var bodyWeight: UITextField!
    @IBOutlet weak var timeElapsed: UITextField!
     @IBOutlet weak var BloodContent: UILabel!
    @IBOutlet weak var genderControl: UISegmentedControl!
    
    @IBAction func changeGender(sender: UISegmentedControl) {
    }
    
    
   
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad(){
        drinkVolume.delegate=self
        alcoholContent.delegate=self
        bodyWeight.delegate=self
        timeElapsed.delegate=self
        super.viewDidLoad()
    }
    
    func calculatebac(){
        
        let volumedrunk = (drinkVolume.text as NSString).floatValue
        let contentalcohol = (alcoholContent.text as NSString).floatValue
        let alcoholConsumed = volumedrunk * contentalcohol * 0.789
        var r : Float = 0.0
        
        let weightBody = (bodyWeight.text as NSString).floatValue
        
        let bodyWeightinGrams = weightBody * 453.6
    
        if genderControl.selectedSegmentIndex==0{
            r = 0.68
        }
        else if genderControl.selectedSegmentIndex==1{
           r = 0.55
      }
        let BAC=(alcoholConsumed/bodyWeightinGrams * r) * 100
        let timepast=(timeElapsed.text as NSString).floatValue

        let trueBAC=BAC - (timepast * 0.015)
        
        println(trueBAC)
        
        BloodContent.text=String(format: "%.2f", trueBAC)
            }
    
    func textFieldDidEndEditing(textField: UITextField) {
        calculatebac()
  }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

