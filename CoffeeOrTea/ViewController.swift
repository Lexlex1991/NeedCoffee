//
//  ViewController.swift
//  CoffeeOrTea
//
//  Created by Alexander Silkin on 2/21/17.
//  Copyright © 2017 Alexander Silkin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func coffeeButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "toCoffeeVC", sender: nil)
    }
    @IBAction func teaButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "toTeaVC", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

