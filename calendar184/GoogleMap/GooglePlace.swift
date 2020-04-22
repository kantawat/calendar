
import UIKit
import Foundation
import CoreLocation
import SwiftyJSON
import GoogleMaps

class GooglePlace {
    let name: String
    let address: String
    let coordinate: CLLocationCoordinate2D
    let distance: Double

    init(dictionary: [String: Any],loctaion:CLLocationCoordinate2D)
    {
        let json = JSON(dictionary)
        name = json["name"].stringValue
        address = json["vicinity"].stringValue
        
        let lat = json["geometry"]["location"]["lat"].doubleValue as CLLocationDegrees
        let lng = json["geometry"]["location"]["lng"].doubleValue as CLLocationDegrees
        coordinate = CLLocationCoordinate2DMake(lat, lng)
        
        let location1 = CLLocation(latitude: loctaion.latitude, longitude: loctaion.longitude)
        let location2 = CLLocation(latitude: lat, longitude: lng)

        distance = location1.distance(from: location2)

    }
}
