//
//  ViewController.swift
//  GitXcode
//
//  Created by Carlos Alberto Savi on 23/11/16.
//  Copyright © 2016 Carlos Alberto Savi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func btnHello(_ sender: Any) {
        
        let alerta = UIAlertController(title: "Hello World", message: "My First App in Swift", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alerta.addAction(action)
        present(alerta, animated: true, completion: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func unwindToHomeScreen(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    

}

