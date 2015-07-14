//
//  MapViewController.swift
//  SwiftStudies
//
//  Created by Taqtile on 7/7/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit
import MapKit

let initialLocation = CLLocation(latitude: -23.545181, longitude: -46.652164)

class MapViewController: BaseViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    var locationManager:LocationManager?
    var storeToShowCallout:Store?
    var selectedAnnotationView:MKAnnotationView?
    var calloutView:MapCalloutView?
    
    var tableManager:BaseTableViewManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setTabBarVisible(false, animated: false)
    }
    
    private func setup() {
        locationManager = LocationManager(callback: self)
        mapView.delegate = self
        tableManager = StoreTableManager(tableView: tableView, delegate: self)
        tableView.backgroundColor = UIColor.whiteColor()
    }
    
    private func requestStores(location: CLLocation){
        view.startLoading()
        StoreProvider.getAllStores(self)
    }
    
    @IBAction func locationAction(sender: AnyObject) {
        locationManager?.startGettingLocation()
    }
    
    private func centerMapOnLocation(location: CLLocation) {
        let regionRadius:Double = 1000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    private func removeAllPins() {
        for annotation in mapView.annotations {
            if let mapPin = annotation as? MapPin {
                mapView.removeAnnotation(mapPin)
            }
        }
    }
    
    private func addPinsForStores(stores:[Store]) {
        removeAllPins()
        for store in stores {
            let pin = MapPin(title: store.name!, coordinate: CLLocationCoordinate2D(latitude: store.latitude!, longitude: store.longitude!))
            pin.store = store
            mapView.addAnnotation(pin)
        }
    }
    
    private func showCallout(store:Store) {
        hideCallout(calloutView)
        var viewOrigin = view.center
        var size:CGSize = MapCalloutView.preferredSize()
        var origin = CGPointMake((viewOrigin.x - (size.width / 2.0)), (view.frame.size.height/2.0) - size.height - pinHeight())
        calloutView = MapCalloutView(frame: CGRectMake(origin.x, origin.y, size.width, size.height))
        calloutView?.setupWithStore(store)
        view.addSubview(calloutView!)
    }
    
    private func hideCallout(callout:UIView?) {
        if calloutView != nil {
            calloutView!.removeFromSuperview()
            calloutView = nil
        }
    }
    
    //MARK: Public methods
    func imageNameForPin(selected:Bool) -> String {
        if selected {
            return "pin"
        }else {
            return "pin-selected"
        }
    }
    
    func pinHeight() -> CGFloat {
        return 40
    }
    
}

//MARK: MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        if let mapPin = annotation as? MapPin {
            let identifier = "MAP_PIN_IDENTIFIER"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
                as? MKPinAnnotationView {
                    dequeuedView.annotation = annotation
                    view = dequeuedView
            } else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = false
            }
            view.image = UIImage(named: imageNameForPin(false))
            view.annotation = annotation
            return view
        }
        return nil
    }
    
    func mapView(mapView: MKMapView!, didSelectAnnotationView view: MKAnnotationView!) {
        if let mapPin = view.annotation as? MapPin {
            view.image = UIImage(named: imageNameForPin(true))
            storeToShowCallout = mapPin.store
            centerMapOnLocation(CLLocation(latitude: mapPin.store!.latitude!, longitude: mapPin.store!.longitude!))
            selectedAnnotationView = view
        }
    }
    
    func mapView(mapView: MKMapView!, didDeselectAnnotationView view: MKAnnotationView!) {
        if let mapPin = view.annotation as? MapPin {
            view.image = UIImage(named: imageNameForPin(false))
            hideCallout(calloutView)
        }
    }
    
    func mapView(mapView: MKMapView!, regionDidChangeAnimated animated: Bool) {
        if storeToShowCallout != nil {
            showCallout(storeToShowCallout!)
            storeToShowCallout = nil
            return
        }else {
            hideCallout(calloutView)
            if selectedAnnotationView != nil{
                mapView.deselectAnnotation(selectedAnnotationView?.annotation, animated: false)
                selectedAnnotationView = nil
            }
        }
    }
    
    func mapView(mapView: MKMapView!, regionWillChangeAnimated animated: Bool) {
        hideCallout(calloutView)
        if selectedAnnotationView != nil {
            mapView.deselectAnnotation(selectedAnnotationView?.annotation, animated: false)
            selectedAnnotationView = nil
        }
    }
    
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        let lineView = MKPolylineRenderer(overlay: overlay)
        lineView.strokeColor = UIColor.blackColor()
        
        return lineView
    }
    
}

extension MapViewController: BaseTableViewManagerDelegate {

    override func didSelectObject(object: AnyObject) {
        println(object)
    }
    
}

extension MapViewController {
    
    private func centerMap(locations: [CLLocation]) {
        var minLat:Double = 180
        var minLng:Double = 180
        var maxLat:Double = -180
        var maxLng:Double = -180
        
        for location in locations {
            minLat = min(minLat, location.coordinate.latitude)
            minLng = min(minLng, location.coordinate.longitude)
            maxLat = max(maxLat, location.coordinate.latitude)
            maxLng = max(maxLng, location.coordinate.longitude)
        }
        
        let mediumLat = (minLat+maxLat)/2.0
        let mediumLng = (minLng+maxLng)/2.0
        
        let minLocation = CLLocation(latitude: minLat, longitude: minLng)
        let maxLocation = CLLocation(latitude: maxLat, longitude: maxLng)
        let mediumLocation = CLLocation(latitude: mediumLat, longitude: mediumLng)
        
        let distance = minLocation.distanceFromLocation(maxLocation)
        let regionRadius:Double = 1000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(mediumLocation.coordinate,
            distance, distance)
        mapView.setRegion(coordinateRegion, animated: true)
        
    }
    
}

extension CLLocationCoordinate2D {
    
    func toCLLocation() -> CLLocation {
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
}

//MARK: LocationManagerCallback
extension MapViewController: LocationManagerCallback {
    
    func didGetLocation(location: CLLocation) {
        centerMapOnLocation(location)
        requestStores(location)
    }
    
    func didGetNoLocations() {
        centerMapOnLocation(initialLocation)
        requestStores(initialLocation)
    }
    
    func didGetNoLocations(message:String) {
        alert(message)
        didGetNoLocations()
    }
    
}

//MARK: StoreProviderCallback
extension MapViewController: StoreProviderCallback {
    
    override func prepareToResponse() {
        super.prepareToResponse()
        view.stopLoading()
    }
    
    func onSuccessStores(stores: Array<Store>) {
        addPinsForStores(stores)
        
        var array = Array<CLLocation>()
        for store in stores {
            let location = CLLocation(latitude: store.latitude!, longitude: store.longitude!)
            array.append(location)
        }
        centerMap(array)
        drawPolygonForLocations(array)
        tableManager?.updateWithData(stores)
    }
    
    func drawPolygonForLocations(locations: [CLLocation]){
        mapView.removeOverlays(mapView.overlays)
        let pointsCount = locations.count+1
        
        var pointsToUse: [CLLocationCoordinate2D] = []
        
        for location in locations {
            pointsToUse.append(location.coordinate)
        }
        pointsToUse.append(locations[0].coordinate)
        
        let myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsCount)
        
        mapView.addOverlay(myPolyline)
    }
    
}
