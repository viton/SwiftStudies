//
//  LocationManager.swift
//  SwiftStudies
//
//  Created by Taqtile on 7/7/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit
import MapKit

protocol LocationManagerCallback {
    
    func didGetLocation(location: CLLocation)
    
    func didGetNoLocations()
    
    func didGetNoLocations(mesage:String)
    
}

class LocationManager: NSObject {
   
    var locationManager:CLLocationManager?
    var callback:LocationManagerCallback?
    
    init(callback: LocationManagerCallback) {
        locationManager = CLLocationManager()
        self.callback = callback
        super.init()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
    }
    
}

//MARK: CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error \(error.localizedDescription)")
        locationManager?.stopUpdatingLocation()
        if(error.code == CLError.Denied.rawValue) {
            println("CLERROR: Denied")
            callback?.didGetNoLocations("Ops. Autorize o aplicativo a acessar sua localização. Vá em ajustes -> Privacidade -> Localização -> SwiftStudies")
        }else {
            callback?.didGetNoLocations()
        }
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        println("authorization status \(status)")
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        println("did update locations")
        locationManager?.stopUpdatingLocation()
        if let clLocations = locations as? [CLLocation] {
            if(clLocations.count > 0) {
                callback?.didGetLocation(clLocations[0])
                return
            }
        }
        callback?.didGetNoLocations()
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!) {
        locationManager?.stopUpdatingLocation() 
        println("did update to location")
    }
    
}
