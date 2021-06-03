//
//  ViewController.swift
//  Assignment777
//
//  Created by Adilzhan Jumakanov on 25.03.2021.
//

import UIKit
import MapKit
import CoreData

class customPin: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var previousLocation: CLLocation?
    
    
    init(pinTitle: String, pinSubTitle: String, location: CLLocationCoordinate2D){
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
    }
}

class ViewController: UIViewController, MKMapViewDelegate, changeAnnotationDelegate {
    
    var i: Int = 0
    
    
    @IBOutlet weak var navigatiomItem: UINavigationItem!
    
    func change(_ annotation: MKAnnotation, _ title: String, _ subtitle: String) {
        for i in 0...(points.count-1){
            if points[i].isEqual(annotation){
                
                let annotation2 = MKPointAnnotation()
                annotation2.title = title
                annotation2.subtitle = subtitle
                annotation2.coordinate = points[i].coordinate
                
                points.remove(at: i)
                points.append(annotation2)
                myMap.delegate = self
               // myMap.annotationVisibleRect
               // myMap.annotations
                myMap.showAnnotations(points, animated: true)
               // myMap.reloadInputViews()
            }
        }
        
    }
    

    
    var points: [MKPointAnnotation] = []
    
    @IBOutlet weak var myMap: MKMapView!
    var mapType: [Int: MKMapType] = [0: .hybrid, 1: .standard, 2: .satellite]
    
    @IBAction func segmentSelected(_ sender: UISegmentedControl) {
        myMap.mapType = mapType[sender.selectedSegmentIndex] ?? .standard
    }
    
       
    @IBAction func leftButton(_ sender: UIButton) {
        i = i - 1
        if i < 0 {
            i = points.count - 1
        }
        
        myMap.showAnnotations([points[i]], animated: true)
        
        navigationItem.title = points[i].title
        
    }
    
    
    @IBAction func rightButton(_ sender: UIButton) {
        i = i + 1
        if i > points.count - 1{
            i = 0
        }
        print(i)
        myMap.showAnnotations([points[i]], animated: true)
        
        navigationItem.title = points[i].title
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myMap.mapType = .hybrid
        
        points = loadPoints()
        navigationItem.title = myMap.userLocation.title
        
    }
    
    
    
    @IBAction func touched(_ sender: UIBarButtonItem) {
        let newVC = self.storyboard?.instantiateViewController(identifier: "listOfPoints") as! listOfPoints
        newVC.points = points
        newVC.delegate = self
        self.navigationController?.pushViewController(newVC, animated: true)
        
    }
    

    @IBAction func longTap(_ sender: UILongPressGestureRecognizer) {
        
        
        let touchPoint = sender.location(in: self.myMap)
        let coordinate = self.myMap.convert(touchPoint, toCoordinateFrom: self.myMap)
        
        
        
        let alertController = UIAlertController(title: "New location", message: "Fill the fields", preferredStyle: .alert)
        
        alertController.addTextField{(textField) in
            textField.placeholder = "Location"
        }
        alertController.addTextField{(textField) in
        textField.placeholder = "Description"
        }
        
        let save = UIAlertAction(title: "OK", style: .default){
            [weak self](alert) in
            let firstTextField = alertController.textFields![0] as UITextField
            let secondTextField = alertController.textFields![1] as UITextField
            
            let annotation = MKPointAnnotation()
            annotation.title = firstTextField.text
            annotation.subtitle = secondTextField.text
            annotation.coordinate = coordinate
            
            self?.myMap.addAnnotation(annotation)
            
            self?.points.append(annotation)
            
            self?.savePoint(annotation)
            
            self?.myMap.delegate = self
        }
        
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(save)
        alertController.addAction(cancelAction)
        
        
        self.present(alertController, animated: true, completion: nil)
    }
     
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation{
            return nil
        }
        
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customannotation")
        annotationView.image = UIImage(named: "pin")
        annotationView.canShowCallout = true
        annotationView.rightCalloutAccessoryView = UIButton(type: .infoLight)
        
        return annotationView
    }
    
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl){
        
        
        let vc = self.storyboard?.instantiateViewController(identifier: "changeVC") as! changeVC
        
        
        vc.text1 = view.annotation?.title ?? ""
        vc.text2 = view.annotation?.subtitle ?? ""
        vc.annotation = view.annotation
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
        
        print("Hello")
        
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool){
        let center = getCenterLocation(for: mapView)
        let geoCoder = CLGeocoder()
        
        geoCoder.reverseGeocodeLocation(center){ [weak self] (placemarks, erroe) in
            guard let self = self else {return}
            
//            if let _ = error{
//                return
//            }
            
            guard let placemark = placemarks?.first else{
                return
            }
        }
    }
    
    func loadPoints()->[MKPointAnnotation]{
        return points
    }
    
    func savePoint(_ point: MKPointAnnotation){
        if let appDelegate = UIApplication.shared.delegate as?
            AppDelegate{
            let context = appDelegate.persistentContainer.viewContext
            if let entity = NSEntityDescription.entity(forEntityName: "Points", in: context){
            let points = NSManagedObject(entity: entity, insertInto: context)
                points.setValue(point, forKey: "point")
                do{
                try
                    context.save()
                    self.points.append(point)
                }catch{
                    print("Warning!")
                }
            }
        }
    }
    
    func getCenterLocation(for mapView: MKMapView)->CLLocation{
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
    }

}

extension ViewController : listOfPointsDelegate{

    func goTo(to index: Int){
        myMap.showAnnotations([points[index]], animated: true)
    }
}





