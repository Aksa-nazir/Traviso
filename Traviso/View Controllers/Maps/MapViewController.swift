//
//  MapViewController.swift
//  Traviso
//
//  Created by aksa nazir on 30/04/21.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate  {

    @IBOutlet weak var textadress: UITextField!
    @IBOutlet weak var dButton: UIButton!
    @IBOutlet weak var map: MKMapView!

    var locationManager = CLLocationManager()


    override func viewDidLoad() {
        super.viewDidLoad()


        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

        map.delegate = self

        // Do any additional setup after loading the view.
    }


    @IBAction func getDirrectionTapper(_ sender: Any) {
        getAddress()

    }
        func getAddress() {

            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(textadress.text!) { (placemarks, error) in
                guard let placemarks = placemarks, let location = placemarks.first?.location

                else {
                    print("No Location found")
                    return
                }
                print(location)
                self.mapThis(destinationCord: location.coordinate)

            }



        }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
    }

    func mapThis(destinationCord: CLLocationCoordinate2D) {

        let sourceCoordinate = (locationManager.location?.coordinate)!
        let sourcePlaceMark = MKPlacemark(coordinate: sourceCoordinate)
        let destPlaceMark =  MKPlacemark(coordinate: destinationCord)
        let sourceItem = MKMapItem(placemark: sourcePlaceMark)
        let destItem = MKMapItem(placemark: destPlaceMark)

        let destinationRequest = MKDirections.Request()
        destinationRequest.source = sourceItem
        destinationRequest.destination = destItem
        destinationRequest.transportType = .automobile
        destinationRequest.requestsAlternateRoutes = true


        let directions = MKDirections(request: destinationRequest)
        directions.calculate { (response, error) in
            guard let response = response else {

            if let error = error {
                print("something is wrong :( ")
            }
            return
        }

        let route = response.routes[0]
        self.map.addOverlay(route.polyline)
        self.map.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
    }



}

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let render = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        render.strokeColor = .blue
        return render

    }
    }

