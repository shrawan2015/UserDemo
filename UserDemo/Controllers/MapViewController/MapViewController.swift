//
//  MapViewController.swift
//  UserDemo
//
//  Created by Shrawan Kumar sharma on 05/03/23.
//

import UIKit
import MapKit

// MARK: - MapViewController
class MapViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var mapViewOutlet: MKMapView!
    
    // MARK: - Internal Properties
    var user: User?
}

// MARK: - View Life Cycle
extension MapViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpView()
    }
    
}

// MARK: - Initial Configuration
extension MapViewController{
    
    private func setUpView(){
        if let user = user , let locationCoordinate = user.address.geo.locationCoordinate{
            let annotation = MKPointAnnotation()
            annotation.title = user.name
            annotation.subtitle = user.company.name
            annotation.coordinate = locationCoordinate
            mapViewOutlet.addAnnotation(annotation)
            mapViewOutlet.centerCoordinate = annotation.coordinate
            mapViewOutlet.delegate = self
        }else{
            print("No Coorinate found")
        }
    }
    
}

// MARK: - MapViewDelegateMethods
extension MapViewController:MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
       
        if let user = user , let locationCoordinate = user.address.geo.locationCoordinate{
            let latDelta:CLLocationDegrees = 0.5
            let lonDelta:CLLocationDegrees = 0.5
            mapView.setRegion(MKCoordinateRegion(center: locationCoordinate, span: MKCoordinateSpan(latitudeDelta:latDelta , longitudeDelta: lonDelta)), animated: true)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        let identifier = "userDetails"
        var mkPinAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if mkPinAnnotationView == nil {
            mkPinAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            mkPinAnnotationView?.canShowCallout = true
        } else {
            mkPinAnnotationView?.annotation = annotation
        }
        mkPinAnnotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        return mkPinAnnotationView
    }
    
}

