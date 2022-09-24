//
//  KonumVC.swift
//  NumNum
//
//  Created by EMRE on 24.09.2022.
//

import UIKit
import MapKit

class KonumVC: UIViewController {

    @IBOutlet var mapView: MKMapView!
    var lm = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sipariş Durumu"
        navigationItem.hidesBackButton = true
        lm.desiredAccuracy = kCLLocationAccuracyBest
        lm.requestWhenInUseAuthorization()
        lm.startUpdatingLocation()
        lm.delegate = self
        }
    @IBAction func goToMenuButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
        self.dismiss(animated: true)
    }
}
    extension KonumVC: CLLocationManagerDelegate {
        public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            let sonKonum = locations[locations.count - 1]
            
            let konum = CLLocationCoordinate2D(latitude: sonKonum.coordinate.latitude,
                                               longitude: sonKonum.coordinate.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
            let bolge = MKCoordinateRegion(center: konum, span: span)
            mapView.setRegion(bolge, animated: true)
            
            let pin = MKPointAnnotation()
            pin.coordinate = konum
          
            mapView.addAnnotation(pin)
            mapView.showsUserLocation = true
            
        }
    }

