//
//  MenuTransitionAnimator.swift
//  TumblrMenu
//
//  Created by ZachZhang on 16/6/25.
//  Copyright © 2016年 ZachZhang. All rights reserved.
//

import UIKit

class MenuTransitionAnimator : NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    private var presenting = false
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()
        
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        let menuController = !self.presenting ? fromViewController as! MenuController : toViewController as! MenuController
        let mainController = !self.presenting ? toViewController : fromViewController
        
        let menuView = menuController.view
        let mainView = mainController.view
        
        containerView?.addSubview(mainView)
        containerView?.addSubview(menuView)
        
        if self.presenting {
            dismissMenuController(menuController)
        }
        
        let duration = transitionDuration(transitionContext)
        
        UIView.animateWithDuration(duration,
                                   delay: 0.0,
                                   usingSpringWithDamping: 0.7,
                                   initialSpringVelocity: 0.8,
                                   options: [],
                                   animations: {
                                    if self.presenting {
                                        self.presentMenuController(menuController)
                                    } else {
                                        self.dismissMenuController(menuController)
                                    }
                                
            }, completion: {
                (finished) -> Void in
                transitionContext.completeTransition(true)
                if self.presenting {
                    containerView?.addSubview(menuView)
                } else {
                    menuView.removeFromSuperview()
                }
        })
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
    
    // MARK: Private
    private func offstage(offset: CGFloat) -> CGAffineTransform {
        return CGAffineTransformMakeTranslation(offset, 0)
    }
    
    private func dismissMenuController(menuController: MenuController) {
        menuController.view.alpha = 0.0
        
        let topRowOffset : CGFloat = 300.0
        let middleRowOffset : CGFloat = 150.0
        let bottomRowOffset : CGFloat = 50.0
        
        menuController.textMenu.transform = offstage(-topRowOffset)
        menuController.textLabel.transform = offstage(-topRowOffset)
        
        menuController.photoMenu.transform = offstage(topRowOffset)
        menuController.photoLabel.transform = offstage(topRowOffset)
        
        menuController.quoteMenu.transform = offstage(-middleRowOffset)
        menuController.quoteLabel.transform = offstage(-middleRowOffset)
        
        menuController.linkMenu.transform = offstage(middleRowOffset)
        menuController.linkLabel.transform = offstage(middleRowOffset)
        
        menuController.chatMenu.transform = offstage(-bottomRowOffset)
        menuController.charLabel.transform = offstage(-bottomRowOffset)
        
        menuController.audioMenu.transform = offstage(bottomRowOffset)
        menuController.audioLabel.transform = offstage(bottomRowOffset)
    }
    
    private func presentMenuController(menuController : MenuController) {
        menuController.view.alpha = 1.0
        
        menuController.textMenu.transform = CGAffineTransformIdentity
        menuController.textLabel.transform = CGAffineTransformIdentity
        
        menuController.photoMenu.transform = CGAffineTransformIdentity
        menuController.photoLabel.transform = CGAffineTransformIdentity
        
        menuController.quoteMenu.transform = CGAffineTransformIdentity
        menuController.quoteLabel.transform = CGAffineTransformIdentity
        
        menuController.linkMenu.transform = CGAffineTransformIdentity
        menuController.linkLabel.transform = CGAffineTransformIdentity
        
        menuController.chatMenu.transform = CGAffineTransformIdentity
        menuController.charLabel.transform = CGAffineTransformIdentity
        
        menuController.audioMenu.transform = CGAffineTransformIdentity
        menuController.audioLabel.transform = CGAffineTransformIdentity
    }
}
