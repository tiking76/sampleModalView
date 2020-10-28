//
//  PresentationController.swift
//  modalsample
//
//  Created by 舘佳紀 on 2020/10/27.
//

import UIKit

class PresentationController: UIPresentationController {
    
    var overlayView = UIView()
    
    override func presentationTransitionWillBegin() {
        guard let containeView = containerView else {
            return
        }
        
        overlayView.frame = containerView!.bounds
        overlayView.gestureRecognizers = [UITapGestureRecognizer(target: self, action: #selector(PresentationController.overlayViewDidTouch(_:)))]
        overlayView.backgroundColor = .black
        overlayView.alpha = 0.0
        containeView.insertSubview(overlayView, at: 0)
        
        //run transaction
        presentingViewController.transitionCoordinator?.animate(alongsideTransition: { [weak self] context in
            self?.overlayView.alpha = 0.5
        }, completion: nil)
    }
    
    //call before non preview transaction
    override func dismissalTransitionWillBegin() {
        presentingViewController.transitionCoordinator?.animate(alongsideTransition: { [weak self] context in
            self?.overlayView.alpha = 0.0
        }, completion: nil)
    }
    
    //call after non preview transaction
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            overlayView.removeFromSuperview()
        }
    }
    
    let margin = (x: CGFloat(40), y: CGFloat(220.0))
    // return child contena size
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: parentSize.width - margin.x, height: parentSize.height - margin.y)
    }
    
    //return frame size that call from view Controller
    override var frameOfPresentedViewInContainerView: CGRect {
        var presentedViewFrame = CGRect()
        let containerBounds = containerView!.bounds
        let childContaintSize = size(forChildContentContainer: presentingViewController, withParentContainerSize: containerBounds.size)
        presentedViewFrame.size = childContaintSize
        presentedViewFrame.origin.x = margin.x/2.0
        presentedViewFrame.origin.y = margin.y/2.0
        
        return presentedViewFrame
    }
    
    //call before start layout
    override func containerViewWillLayoutSubviews() {
        overlayView.frame = containerView!.bounds
        presentedView?.frame = frameOfPresentedViewInContainerView
        presentedView?.layer.cornerRadius = 10
        presentedView?.clipsToBounds = true
    }
    
    //call after start layout
    override func containerViewDidLayoutSubviews() {
    }
    
    @objc func overlayViewDidTouch(_ sender: UITapGestureRecognizer) {
        presentingViewController.dismiss(animated: true, completion: nil)
    }

}
