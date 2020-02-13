//
//  TableViewController.swift
//  project16
//
//  Created by Gabriel Lops on 2/11/20.
//  Copyright © 2020 Gabriel Lops. All rights reserved.
//

import UIKit
import WebKit

class TableViewController: UITableViewController {
    var detailedItem: Country?
    var webView: WKWebView!
    
    override func loadView() {
          webView = WKWebView()
          view = webView
      }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Description"
        guard let detailItem = detailedItem else {return}
        
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style> body { font-size: 150%; } </style>
        </head>
        <body>
        \(detailItem.body)
        </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
}
}
    

 
   
