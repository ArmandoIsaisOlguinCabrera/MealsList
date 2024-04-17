//
//  MapController.swift
//  ReceiptsApp
//
//  Created by Armando Isais Olguin Cabrera on 16/04/24.
//

import Foundation
import MapKit

class MapController: UIViewController {
    var mapView: MKMapView!
    
    let viewModel: MapControllerViewModel
    
    init(_ viewModel: MapControllerViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = MKMapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(mapView)
        let geocoder = CLGeocoder()
        let converter = AreaToCountryConverter()
        let placeName = converter.areaToCountry(area: viewModel.meal.strArea) ?? ""
        geocoder.geocodeAddressString(placeName) { (placemarks, error) in
            if let error = error {
                print("Error al convertir el nombre del lugar en coordenadas: \(error.localizedDescription)")
                return
            }
            
            if let placemark = placemarks?.first,
               let location = placemark.location {
                let coordinate = location.coordinate
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                annotation.title = placeName
                self.mapView.addAnnotation(annotation)
                let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 100000, longitudinalMeters: 100000)
                self.mapView.setRegion(region, animated: true)        }
        }
    }
}
