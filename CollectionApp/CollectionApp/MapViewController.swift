//
//  MapViewController.swift
//  CollectionApp
//
//  Created by Артем Соловьев on 18.11.2021.
//

import UIKit
import MapKit

final class MapViewController: UIViewController {
    
    private let animal = Animal(name: nil, description: nil, place: nil, coordinates: nil, type: nil)
    
    override func viewDidLoad() {
        let mapView = MKMapView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        let location = CLLocationCoordinate2DMake(animal.coordinates?.0 ?? 0 , animal.coordinates?.1 ?? 0)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
        
        let annotaion = MKPointAnnotation()
        annotaion.coordinate = location
        annotaion.title = animal.place
        mapView.addAnnotation(annotaion)
        
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        
        view.addSubview(mapView)
    }
}
