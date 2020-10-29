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
        let storyboard = UIStoryboard(name: "ModalViewController", bundle: nil)
        let modalVC = storyboard.instantiateViewController(identifier: "ModalViewController")
        modalVC.modalPresentationStyle = .custom
        modalVC.transitioningDelegate = self
        present(modalVC, animated: true, completion: nil)
    }
    
    func getVcInstance<T: UIViewController>() -> T? {
        let name = String(describing: T.self)
        let bundle = Bundle(for: T.self)
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        
        return storyboard.instantiateInitialViewController() as? T
    }
}


extension ViewController : UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented : UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return PresentationController(presentedViewController: presented, presenting: presenting)
    }
}

