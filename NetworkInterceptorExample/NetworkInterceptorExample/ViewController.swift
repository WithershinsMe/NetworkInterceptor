//
//  ViewController.swift
//  NetworkInterceptorExample
//
//  Created by Kenneth Poon on 10/7/18.
//  Copyright © 2018 Kenneth Poon. All rights reserved.
//

import UIKit
import NetworkInterceptor

class ViewController: UIViewController {

    var session: URLSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let networkConfig = NetworkInterceptorConfig(requestLoggers: [
            RequestLoggerRegistrable.console.logger()
        ])
        
        NetworkInterceptor.shared.setupLoggers(config: networkConfig)
        self.session = URLSession(configuration: URLSessionConfiguration.default)
        
        if let url = URL(string: "https://www.antennahouse.com/XSLsample/pdf/sample-link_1.pdf") {
            let request = URLRequest(url: url)
            if let task = self.session?.dataTask(with: request) {
                task.resume()
                print("task started")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

