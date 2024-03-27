//
//  ViewController.swift
//  TableStory
//
//  Created by Hacksisombath, Briana on 3/20/24.
//

import UIKit
import MapKit

//put my excel data here
let data = [

Item(name: "Ringtail Ridge Natural Area", neighborhood: "San Marcos", desc: "Less than 3 miles. Includes dirt, man-made, and rocky trails. With many prickly pears and a pond.", lat: 29.903501281027275, long: -97.96820722571542, imageName: "ridge_dirt_1"),
Item(name: "Pugatory Creek Natural Area", neighborhood: "San Marcos", desc: "Upper and lower purgatory nearby the highway extend to 5 miles of hills and flat trails.", lat: 29.87758507735378, long: -97.97883308499719, imageName: "pugatory_bridge"),
Item(name: "Schulle Canyon Natural Area", neighborhood: "San Marcos", desc: "Quick 2 mile dirt trails in a loop, many wildlife.", lat: 29.894234904392146, long: -97.95523005640366, imageName: "schuelle-trail-1"),
Item(name: "5 Mile Dam Park", neighborhood: "San Marcos", desc: "Nearby a soccer field.", lat: 29.941628328544372, long: -97.90077384343863, imageName: "5mile"),
Item(name: "Spring Lake Natural Area", neighborhood: "San Marcos", desc: ".5 miles of dirt trail surrounded by forest.", lat:29.902010387797482, long: -97.93982880851942, imageName: "springlake-dirt"),
Item(name: "Prospect Park Trail Head", neighborhood: "San Marcos", desc: "3 miles of trails, man-made trails for running and dirt trails alongside vast areas of empty grassland.", lat: 29.874371316719873, long: -97.96341687442195, imageName: "prospect-pebbles"),


]

// let data =[]

struct Item {
    var name: String
    var neighborhood: String
    var desc: String
    var lat: Double
    var long: Double
    var imageName: String
}



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
//table view outlet
    @IBOutlet weak var theTable: UITableView!
    
//map kit outlet
    @IBOutlet weak var mapView: MKMapView!
    
    
//functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return data.count
   }


   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
       let item = data[indexPath.row]
       cell?.textLabel?.text = item.name
       
       //Add image references
                     let image = UIImage(named: item.imageName)
                     cell?.imageView?.image = image
                     cell?.imageView?.layer.cornerRadius = 10
                     cell?.imageView?.layer.borderWidth = 5
                     cell?.imageView?.layer.borderColor = UIColor.white.cgColor
       
       return cell!
   }
    
//for seg
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let item = data[indexPath.row]
      performSegue(withIdentifier: "ShowDetailSegue", sender: item)
        

  }
      
    // add this function to original ViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailSegue" {
            if let selectedItem = sender as? Item, let detailViewController = segue.destination as? DetailViewController {
                // Pass the selected item to the detail view controller
                detailViewController.item = selectedItem
            }
        }
    }
//NOT edit
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        theTable.delegate = self
        theTable.dataSource = self
        
        
        //map code
        
        //set center, zoom level and region of the map: change center for san marcos - choose one of the items
               let coordinate = CLLocationCoordinate2D(latitude: 29.902010387797482, longitude:  -97.93982880851942)
               let region = MKCoordinateRegion(center: coordinate,span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
               mapView.setRegion(region, animated: true)
               
            // loop through the items in the dataset and place them on the map
                for item in data {
                   let annotation = MKPointAnnotation()
                   let eachCoordinate = CLLocationCoordinate2D(latitude: item.lat, longitude: item.long)
                   annotation.coordinate = eachCoordinate
                       annotation.title = item.name
                       mapView.addAnnotation(annotation)
                       }//end loop

             
    }//end view did load


}

