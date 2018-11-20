//
//  CustomNavigationController.swift
//  XavierDemoiOS
//
//  Created by Wilson Rhodes on 10/19/18.
//  Copyright © 2018 Blackshark Tech. All rights reserved.
//

import Foundation
import UIKit

class CustomNavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        get {
            return UIInterfaceOrientationMask.portrait
        }
    }
}
