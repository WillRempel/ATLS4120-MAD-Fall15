//
//  ViewController.swift
//  Project 2
//
//  Created by Will Rempel on 10/26/15.
//  Copyright (c) 2015 Will Rempel. All rights reserved.
//

import UIKit
import CoreMotion
class ViewController: UIViewController {
    
    @IBOutlet weak var steps: UILabel!

  
    
    let Pedometer = CMPedometer()
    
    override func viewDidLoad() {
        println("IS this one working?")
        
        
        super.viewDidLoad()
        
        let date=NSDate()
        
        
        if(CMPedometer.isStepCountingAvailable()){
            let fromDate = NSDate(timeIntervalSinceNow: -9 * 8)
            self.Pedometer.queryPedometerDataFromDate(fromDate, toDate: NSDate()) { (data : CMPedometerData!, error) -> Void in
                println("\(data.numberOfSteps)")
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    if(error == nil){
                        self.steps.text = "\(data.numberOfSteps)"
                    }
                })
                
            }
            
            self.Pedometer.startPedometerUpdatesFromDate(date) { (data: CMPedometerData!, error) -> Void in
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    if(error == nil){
              
                        self.steps.text = "\(data.numberOfSteps)"
                    }
                })
            }
            
            
            
            
        }
        
        
       
        
}

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}