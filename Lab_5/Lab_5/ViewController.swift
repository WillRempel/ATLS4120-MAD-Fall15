//
//  ViewController.swift
//  Lab_5
//
//  Created by Will Rempel on 10/14/15.
//  Copyright (c) 2015 Will Rempel. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    
    var locationManager = CLLocationManager()
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var span = MKCoordinateSpanMake(0.05, 0.05)
        var region = MKCoordinateRegionMake(manager.location.coordinate, span)
        mapView.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate=manager.location.coordinate
        annotation.title="You are here"
        annotation.subtitle="Latitude:\(manager.location.coordinate.latitude), Longitude:\(manager.location.coordinate.longitude)"
        mapView.addAnnotation(annotation)
        
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        println("didchangeauth")
        if status==CLAuthorizationStatus.AuthorizedWhenInUse{
            locationManager.startUpdatingLocation()
        }
    }
    
        func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!){
            var errorType=String()
            if let clError=CLError(rawValue: error.code){
                if clError == .Denied{
                    errorType="acces denied"
                    let alert=UIAlertController(title: "Error", message: errorType, preferredStyle:UIAlertControllerStyle.Alert)
                    let okAction:UIAlertAction=UIAlertAction(title: "OK", style:UIAlertActionStyle.Default, handler: nil)
                        alert.addAction(okAction)
                    presentViewController(alert, animated: true, completion:nil)
                }
            
        }
    
    
    }

    override func viewDidLoad() {
         super.viewDidLoad()
        locationManager.delegate=self
        locationManager.desiredAccuracy=kCLLocationAccuracyBest
        locationManager.distanceFilter=kCLDistanceFilterNone
        mapView.showsUserLocation=true
        
      mapView.mapType=MKMapType.Hybrid
        var status:CLAuthorizationStatus = CLLocationManager.authorizationStatus()
        if status==CLAuthorizationStatus.NotDetermined{
              locationManager.requestWhenInUseAuthorization()
        }
        
       
        
        
        }
        
        
        
//        let annotation = MKPointAnnotation()
//        annotation.coordinate=location
//        annotation.title="Empire State Building"
//        annotation.subtitle="New York"
//        mapView.addAnnotation(annotation)

        
    
        // Do any additional setup after loading the view, typically from a nib.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

