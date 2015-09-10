//
//  ViewController.swift
//  Lab-1
//
//  Created by Will Rempel on 9/9/15.
//  Copyright (c) 2015 Will Rempel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageText: UILabel!
    @IBOutlet weak var doorImage: UIImageView!
    
    @IBAction func chooseDoor(sender: UIButton) {
        if sender.tag==1{
            doorImage.image=UIImage(named:  "door1.png")
            messageText.text="5 Million Dollars"
        }
        
    else if sender.tag==2{
            doorImage.image=UIImage(named: "door2.png")
            messageText.text="A New Car!"
        }
        
      else if sender.tag==3{
        doorImage.image=UIImage(named: "door3.png")
        messageText.text="A Trip to Hawaii"
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

