//
//  MapViewController.swift
//  Cargo
//
//  Created by Adilet on 5/7/23.
//

import UIKit
import MapKit
import SnapKit

class MapViewController: BaseViewController {
    
    var coordinator: MapCoordinator?
    var mapView: MKMapView = {
        let m = MKMapView()
        return m
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
    }
    
}

extension MapViewController {
    
    func setupSubviews() {
        view.addSubview(mapView)
    }
    
    func setupConstraints() {
        mapView.snp.makeConstraints{make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
}
