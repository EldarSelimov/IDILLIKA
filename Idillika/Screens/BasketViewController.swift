//
//  BasketViewController.swift
//  Idillika
//
//  Created by Eldar on 23.08.2020.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit


class BasketViewController: UIViewController {
    
    @IBOutlet weak var buyButton: UIButton!
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        buyButton.imageEdgeInsets.left = buyButton.frame.width - (buyButton.titleLabel?.frame.width ?? 0) - 20 - (buyButton.imageView?.frame.width ?? 0)
    }

}

