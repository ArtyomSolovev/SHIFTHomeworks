//
//  MapView.swift
//  CollectionApp
//
//  Created by Артем Соловьев on 05.12.2021.
//

import UIKit
import MapKit

final class MapView: UIView {
    
    private var controller: MapViewController?
    private var place: String? = nil
    private var coordinates: (Double, Double)? = nil
    
    private var closeButton : UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        button.setImage(.init(systemName: "xmark"), for: .normal)
        button.tintColor = .label
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return button
    }()
    
    @objc private func closeAction(sender: UIButton) {
        self.controller?.dismiss(animated: true, completion: nil)
    }
    
    private let mapView: MKMapView = {
        let mapView = MKMapView()
        return mapView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func loadView(controller: MapViewController) {
        self.controller = controller
    }
    
    func setupParametrs(place: String, coordinates: (Double, Double)) {
        self.place = place
        self.coordinates = coordinates
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.mapView.frame = CGRect(x: 0, y: 10, width: self.frame.size.width, height: self.frame.size.height)
        let location = CLLocationCoordinate2DMake(coordinates?.0 ?? 0, coordinates?.1 ?? 0)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: location, span: span)
        let annotaion = MKPointAnnotation()
        annotaion.coordinate = location
        annotaion.title = place
        
        self.mapView.addAnnotation(annotaion)
        self.mapView.mapType = MKMapType.standard
        self.mapView.isZoomEnabled = true
        self.mapView.isScrollEnabled = true
        self.mapView.setRegion(region, animated: true)
        
        self.addSubview(mapView)
        self.addSubview(closeButton)
    }
    
}
