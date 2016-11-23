//
//  MapViewController.swift
//  MapasApp
//
//  Created by Carlos Alberto Savi on 31/10/16.
//  Copyright © 2016 Carlos Alberto Savi. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    // MARK: Propriedades
    let meuEndereco = "Rua Inhambú, 864 - Apto 143 - São Paulo/SP - 04563-010"
    
    // MARK: - Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Habilitar o delegate do MapView para personalizar a anotação
        mapView.delegate = self
        
        // Converter o endereço em coordenadas
        let geoCode = CLGeocoder()
        geoCode.geocodeAddressString(meuEndereco, completionHandler: {
            
            placemarks, error in
            
            if error != nil {
                print(error)
                return
            }
            
            // Temos a localização
            if let placemarks = placemarks {
                
                // Recupera a 1ª localização
                let placemark = placemarks[0]
                
                // Adicionar uma anotação
                let annotation = MKPointAnnotation()
                
                if let location = placemark.location {
                    
                    // Coordenada da anotação
                    annotation.coordinate = location.coordinate
                    
                    // Título para anotação
                    annotation.title = "Minha casa"
                    
                    // Adicionar a anotação no mapa
                    self.mapView.addAnnotation(annotation)
                    
                    // Exibe e seleciona a anotação
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                    
                }
            }
            
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    // MARK: - Delegates do MapKIt
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        
//        let identifier = "MeuPin"
//        
//        // Reutiliza a anotação, se possível
//        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
//        
//        if annotationView == nil {
//            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//            annotationView!.canShowCallout = true
//        }
//        
//        let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
//        leftIconView.image = UIImage(named: cafeteria.imagem)
//        annotationView!.leftCalloutAccessoryView = leftIconView
//        
//        return annotationView
//    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
