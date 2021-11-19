//
//  MapViewController.swift
//  CollectionApp
//
//  Created by Артем Соловьев on 18.11.2021.
//

import UIKit
import MapKit

final class MapViewController: UIViewController {
    
    var place: String? = nil
    var coordinates: (Double, Double)? = nil
    
    override func viewDidLoad() {
        let mapView = MKMapView(frame: CGRect(x: 0, y: 10, width: view.frame.size.width, height: view.frame.size.height))
        let location = CLLocationCoordinate2DMake(coordinates?.0 ?? 0, coordinates?.1 ?? 0)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
        
        let annotaion = MKPointAnnotation()
        annotaion.coordinate = location
        annotaion.title = place
        mapView.addAnnotation(annotaion)
        
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        
        view.addSubview(mapView)
    }
}
