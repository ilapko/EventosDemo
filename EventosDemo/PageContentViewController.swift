//
//  PageContentViewController.swift
//  EventosDemo
//
//  Created by Illya Lapko on 13/9/14.
//  Copyright (c) 2014 Awalll. All rights reserved.
//

import Foundation
import UIKit

class PageContentViewController : UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var pageIndex : Int?
    var titleText : String?
    var imageFile : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backgroundImageView.image = UIImage(named: imageFile!)
        self.titleLabel.text = self.titleText

    }
}