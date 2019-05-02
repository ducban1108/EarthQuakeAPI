//
//  ViewController.swift
//  EarthQuakeAPI
//
//  Created by Just Kidding on 4/21/19.
//  Copyright © 2019 Just Kidding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DataService.sharedInstance.makeDataTaskRequest { (data) in
            print(data.features[0].mag!)
        }
        
    }

}
