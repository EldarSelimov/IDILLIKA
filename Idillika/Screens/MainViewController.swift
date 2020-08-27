//
//  MainViewController.swift
//  Idillika
//
//  Created by Eldar on 22.08.2020.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var showButton: UIButton!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showButton.imageEdgeInsets.left = showButton.frame.width - (showButton.titleLabel?.frame.width ?? 0) - 20 - (showButton.imageView?.frame.width ?? 0)
        
        
    }
 
}
