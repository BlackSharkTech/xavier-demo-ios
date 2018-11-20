//
//  TopTabBarController.swift
//  XavierDemoiOS
//
//  Created by Wilson Rhodes on 10/22/18.
//  Copyright © 2018 Blackshark Tech. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TopTabBarController: ButtonBarPagerTabStripViewController {
    override func viewDidLoad() {
        
        settings.style.buttonBarBackgroundColor = UIColor(red: 199/255, green: 6/255, blue: 22/255, alpha: 1.0)
        settings.style.buttonBarItemBackgroundColor = UIColor(red: 199/255, green: 6/255, blue: 22/255, alpha: 1.0)
        settings.style.buttonBarHeight = 60
        settings.style.buttonBarItemFont = UIFont(name: "Verdana", size: 16) ?? UIFont.systemFont(ofSize: UIFont.systemFontSize)
        
        self.title = "Information"
        
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    override public func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return [HowToViewController(), ContactViewController()]
    }
    
}
