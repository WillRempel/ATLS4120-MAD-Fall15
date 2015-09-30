//
//  ViewController.swift
//  RollingStones
//
//  Created by Will Rempel on 9/21/15.
//  Copyright (c) 2015 Will Rempel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var fontSizeLabel: UILabel!
    
    @IBAction func changeFontSize(sender: UISlider) {
        let fontSize=sender.value
        fontSizeLabel.text=String(format: "%.0f", fontSize)
        let fontSizeCGFloat=CGFloat(fontSize)
        titleLabel.font=UIFont.systemFontOfSize(fontSizeCGFloat)
    }
    
    @IBOutlet weak var capitalSwitch: UISwitch!
    
    func updateCaps(){
        if capitalSwitch.on {
            titleLabel.text=titleLabel.text?.uppercaseString
        }else{
            titleLabel.text=titleLabel.text?.lowercaseString
        }}
    
    func updateImage(){
        if imageControl.selectedSegmentIndex==0{
            titleLabel.text="They Used To Be Young"
            stonesImage.image=UIImage(named : "youngStones")
        }
        else if imageControl.selectedSegmentIndex==1{
            titleLabel.text="Now they are old"
            stonesImage.image=UIImage(named: "oldStones")
        }}
    @IBAction func updateFont(sender: UISwitch) {
        updateCaps()
    }
    @IBOutlet weak var imageControl: UISegmentedControl!
    
    @IBAction func changeInfo(sender: UISegmentedControl) {
        updateImage()
        updateCaps()
    }
    
    func refreshUI(){
        titleLabel.text="TheRollingStones"
        imageControl.selectedSegmentIndex = -1
        capitalSwitch.on=false
        stonesImage.image=UIImage(named: "beatles_abbey_road.png")
    }
    
    @IBOutlet weak var stonesImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

