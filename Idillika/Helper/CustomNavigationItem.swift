//
//  CustomNavigationBar.swift
//  Idillika
//
//  Created by Eldar on 25.08.2020.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit

class CustomNavigationItem: UINavigationItem {
    
    override init(title: String) {
        super.init(title: title)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        leftBarButtonItem?.title = nil
        let width = UIScreen.main.bounds.width - 110
        let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 44))
        view.backgroundColor = .white
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.text = title?.uppercased()
        
        view.addSubview(label)
        
        titleView = view
    }
    
}
