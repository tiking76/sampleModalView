//
//  ViewController.swift
//  createplus
//
//  Created by 舘佳紀 on 2020/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var top: View!
    @IBOutlet weak var buttom: View!
    @IBOutlet weak var right: View!
    @IBOutlet weak var left: View!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillLayoutSubviews() {
        right.transform.rotated(by: 90.0)
        buttom.transform.rotated(by: 180.0)
        left.transform.rotated(by: 270.0)
    }
    
    
}

