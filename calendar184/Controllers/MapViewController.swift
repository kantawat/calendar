

import UIKit
import GoogleMaps

class MapViewController: UIViewController{

    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addressLabel: UILabel!
    private let locationManager = CLLocationManager()
    private let dataProvider = GoogleDataProvider()
    private let searchRadius: Double = 1000
    var places:[GooglePlace] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self as CLLocationManagerDelegate
        locationManager.requestWhenInUseAuthorization()
        mapView.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }
    private func fetchNearbyPlaces(coordinate: CLLocationCoordinate2D) {
        mapView.clear()
        
        dataProvider.fetchPlacesNearCoordinate(coordinate, radius:searchRadius, word: searchMap) { places in

            self.places = places.sorted(by: { $0.distance < $1.distance })
            places.forEach {
                let marker = PlaceMarker(place: $0)
                marker.map = self.mapView
            
            }
            self.tableView.reloadData()
            
        }

    }

    @IBAction func backBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "todetail",sender: self)
    }
    
    private func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D) {
        
        
        let geocoder = GMSGeocoder()
        

        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            guard let address = response?.firstResult(), let lines = address.lines else {
                return
            }
            
            UIView.animate(withDuration: 0.25) {
                self.view.layoutIfNeeded()
            }
        }
    }

}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        guard status == .authorizedWhenInUse else {
            return
        }
        
        locationManager.startUpdatingLocation()
        
        
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        
        locationManager.stopUpdatingLocation()
        
        fetchNearbyPlaces(coordinate: location.coordinate)
    }
}

// MARK: - GMSMapViewDelegate
extension MapViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        reverseGeocodeCoordinate(position.target)
    }
}

extension MapViewController: UITableViewDelegate, UITableViewDataSource {
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.places.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.00;//Choose your custom row height
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! mapTableViewCell
        if(self.places.count > 0){
            print("place : \(self.places[indexPath.row].name)  : \(self.places[indexPath.row].distance)")
            
            tableView.backgroundColor = UIColor.clear
            cell.backgroundColor = UIColor.clear
            cell.nameStoretxt.text = self.places[indexPath.row].name
            cell.distancetxt.text = "ระยะก่างจากคุณ \(Int(self.places[indexPath.row].distance)) เมตร"
            cell.tag = indexPath.row
    
            cell.mapbtn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
                       
        }
                   
       return cell
    }
               
   @objc func buttonAction(sender: UIButton!) {
      
    if (UIApplication.shared.canOpenURL(NSURL(string:"comgooglemaps://")! as URL)) {
        let place = self.places[sender.tag]
        UIApplication.shared.openURL(NSURL(string:"comgooglemaps://?saddr=&daddr=\(place.coordinate.latitude),\(place.coordinate.longitude)&directionsmode=driving")! as URL)

        } else {
            NSLog("Can't use comgooglemaps://");
        }
    }
       
}

