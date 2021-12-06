//
//  MapViewController.swift
//  CollectionApp
//
//  Created by Артем Соловьев on 18.11.2021.
//

import UIKit
import MapKit

final class MapViewController: UIViewController {
    
    private var viewMap: MapView?
    private var viewModel = MapViewModel()
    var animal: Animal?
    
    init(){
        self.viewMap = MapView(frame: UIScreen.main.bounds)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.viewMap?.loadView(controller: self)
        self.viewMap?.setupParametrs(place: animal?.name ?? "", coordinates: animal?.coordinates ?? (0,0))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.viewMap?.configure()
        if let viewMap = viewMap{
        self.view.addSubview(viewMap)
        }
    }
    
    override func viewDidLoad() {
        self.viewModel.data.setNotify { [weak self] place, coordinates
            in
            self?.viewMap?.setupParametrs(place: place, coordinates: coordinates)
            self?.viewMap?.configure()
        }
    }
}
