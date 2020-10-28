//
//  ViewController.swift
//  modalsample
//
//  Created by 舘佳紀 on 2020/10/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func modalAction(_ sender: Any) {
        let modalVC = self.storyboard?.instantiateViewController(withIdentifier: "modal")
        modalVC!.modalPresentationStyle = .custom
        modalVC!.transitioningDelegate = self
        present(modalVC!, animated: true, completion: nil)
    }
}

extension ViewController : UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented : UIViewController, presenting: UIViewController?, source: UIViewController
) -> UIPresentationController? {
        return PresentationController(presentedViewController: presented, presenting: presenting)
    }
}

