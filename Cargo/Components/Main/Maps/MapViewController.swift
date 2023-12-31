//
//  MapViewController.swift
//  Cargo
//
//  Created by Adilet on 5/7/23.
//

//import UIKit
//import MapKit
//import SnapKit

//class MapViewController: BaseViewController {
//
//    var coordinator: MapCoordinator?
//    var mapView: MKMapView = {
//        let m = MKMapView()
//        return m
//    }()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//        setupConstraints()
//    }
//
//}
//
//extension MapViewController {
//
//    func setupSubviews() {
//        view.addSubview(mapView)
//    }
//
//    func setupConstraints() {
//        mapView.snp.makeConstraints{make in
//            make.top.left.right.bottom.equalToSuperview()
//        }
//    }
//
//}

import UIKit
import TrimbleMaps
import TrimbleMapsAccounts
import AppTrackingTransparency
import Polyline
import RoutePlugin
import TrimbleMapsWebservicesClient



class BasicMapViewController: UIViewController, AccountManagerDelegate {
    
    var coordinator: MapCoordinator?
    

    internal var mapView: MGLMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let account = Account(apiKey: "67DA55DF4C94B94D9C407A33F901835A", region: Region.northAmerica)
        AccountManager.default.account = account
        AccountManager.default.delegate = self
    }
    
    func stateChanged(newStatus: TrimbleMapsAccounts.AccountManagerState) {
        if newStatus == .loaded {
            DispatchQueue.main.async {
                // Create a map view
                self.mapView = MGLMapView(frame: self.view.bounds)
                
                // Add the map
                self.view.addSubview(self.mapView)
                
                self.mapView.userTrackingMode = .followWithHeading
                self.mapView.showsUserLocation = true
                self.mapView.showsUserHeadingIndicator = true
            }
        }
    }
    
    func mapView(_ mapView: MGLMapView, didUpdate userLocation: MGLUserLocation?) {
        guard let coord = userLocation?.coordinate else {
            return
        }
        
        mapView.setCenter(coord, animated: true)
        
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MGLMapView) {
        self.createSimpleRoute()
    }
    
    func createSimpleRoute() {
        let origin = CLLocationCoordinate2D(latitude: 42.836278, longitude: 74.624322)
        let destination = CLLocationCoordinate2D(latitude: 42.844953, longitude: 74.586187)
        
        let routePlugin = RoutePlugin(mapView: mapView)
        let route = Route()
        
        let wayPoints = [
            Waypoint(coordinate: origin, name: "Loading point"),
            Waypoint(coordinate: destination, name: "Unloading place")
        ]
        
        let options = RouteOptions(waypoints: wayPoints)
        options.shapeFormat = .polyline6
        options.routeShapeResolution = .full
        
        route.routeOptions = options
        route.color = .magenta
        
        routePlugin.addRoute(route)
    }
    
    

}
