//
//  ViewController.swift
//  Animations
//
//  Created by Andriy Pohorilko on 9/18/19.
//  Copyright © 2019 Andriy Pohorilko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton.alpha = 0
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        myButton.animate([
            .fadeIn(),
            .scale()
        ])
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.animate([
            .scale()
        ])
    }
    
    

}

