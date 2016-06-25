//
//  MenuController.swift
//  TumblrMenu
//
//  Created by ZachZhang on 16/6/25.
//  Copyright © 2016年 ZachZhang. All rights reserved.
//

import UIKit

class MenuController : UIViewController {
    
    private let transitionManager = MenuTransitionAnimator()
    
    
    @IBOutlet weak var textMenu: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var photoMenu: UIButton!
    @IBOutlet weak var photoLabel: UILabel!
    
    @IBOutlet weak var quoteMenu: UIButton!
    @IBOutlet weak var quoteLabel: UILabel!
    
    @IBOutlet weak var linkMenu: UIButton!
    @IBOutlet weak var linkLabel: UILabel!
    
    @IBOutlet weak var chatMenu: UIButton!
    @IBOutlet weak var charLabel: UILabel!
    
    @IBOutlet weak var audioMenu: UIButton!
    @IBOutlet weak var audioLabel: UILabel!
    
    @IBAction func dismissAction(sender: UIButton) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.transitioningDelegate = self.transitionManager
    }
}
