//
//  DetailViewController.swift
//  EarthQuakeAPI
//
//  Created by Just Kidding on 4/26/19.
//  Copyright © 2019 Just Kidding. All rights reserved.
//

import UIKit
import WebKit
class DetailViewController: UIViewController {
    var urlString = ""
     @IBOutlet weak var myWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(myWebView)
        if let url = URL(string: urlString) {
            myWebView.load(URLRequest(url: url))
        }

    }

    
    

    

}
