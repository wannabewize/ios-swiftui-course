//
//  StoresViewController.swift
//  TabAndNavigation
//
//  Created by wannabewize on 10/30/23.
//

import UIKit
import MapKit

class StoresViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showrooms.forEach { item in
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)
            annotation.title = item.name
            mapView.addAnnotation(annotation)
        }
        
        title = "Show Rooms"
        
        mapView.delegate = self
    }
}

extension StoresViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        performSegue(withIdentifier: "ShowRoomDetailSegue", sender: annotation)
    }
}
