//
//  DetailViewController.swift
//  TableStory
//
//  Created by Hacksisombath, Briana on 3/25/24.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    
    var item: Item?
    
    
    @IBOutlet weak var detailImage: UIImageView!
    
    
    @IBOutlet weak var detailName: UILabel!
    
    
    @IBOutlet weak var detailDescription: UILabel!
    

    @IBOutlet weak var mapView: MKMapView!
    
    
    
    
    
    
///
    override func viewDidLoad() {
        super.viewDidLoad()
        detailName?.text = item?.name
                    detailDescription?.text = item?.desc
                    detailImage?.image = UIImage(named: item!.imageName)
        // Do any additional setup after loading the view.
        // code for map
        let coordinate = CLLocationCoordinate2D(latitude: item!.lat, longitude: item!.long)

        // Create a region centered on your coordinate with a certain span
        let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

        // Set the region of the map view
                            mapView.setRegion(region, animated: true)

        // Create a map annotation for your location
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                annotation.title = item?.name
                   
                            // Add the annotation to the map view
                            mapView.addAnnotation(annotation)
                           
                              
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
