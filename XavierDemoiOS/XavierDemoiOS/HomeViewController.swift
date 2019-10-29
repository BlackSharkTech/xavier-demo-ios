//
//  HomeViewController.swift
//  XavierDemoiOS
//
//  Created by Wilson Rhodes on 10/19/18.
//  Copyright © 2018 Blackshark Tech. All rights reserved.
//

import UIKit
import XavierFramework

class HomeViewController: UIViewController, XavierScannerDelegate {
    
    var blackSharkLogoView = UIImageView()
    var scannerButton = UIButton(type: UIButton.ButtonType.roundedRect)
    var footerView = UILabel()

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: Lifecycle Hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        
        self.view.backgroundColor = UIColor.white
        
        self.title = "Xavier Demo"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 199/255, green: 6/255, blue: 22/255, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.isTranslucent = false
        
        let infoButton = UIButton(type: .infoLight)
        infoButton.addTarget(self, action: #selector(showInfo), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: infoButton)
        self.navigationItem.rightBarButtonItem = barButton
        
        self.view.addSubview(blackSharkLogoView)
        
        blackSharkLogoView.image = UIImage(named: "bstLogoWhite")
        blackSharkLogoView.contentMode = .scaleAspectFit
        blackSharkLogoView.clipsToBounds = true
        blackSharkLogoView.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = blackSharkLogoView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = blackSharkLogoView.topAnchor.constraint(equalTo: view.topAnchor)
        let widthConstraint = blackSharkLogoView.widthAnchor.constraint(lessThanOrEqualToConstant: 500)
        widthConstraint.priority = .required
        let widthConstraintScreenSize = blackSharkLogoView.widthAnchor.constraint(equalToConstant: screenWidth - 40)
        widthConstraintScreenSize.priority = .defaultHigh
        
        let heightConstraint = blackSharkLogoView.heightAnchor.constraint(equalToConstant: screenHeight/3)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, widthConstraintScreenSize, heightConstraint])
        
        self.view.addSubview(scannerButton)
        
        let attrTitle = NSMutableAttributedString(string: "START SCANNER", attributes: [ NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16.0), NSAttributedString.Key.foregroundColor: UIColor.white ])
        
        scannerButton.setAttributedTitle(attrTitle, for: .normal)
        scannerButton.backgroundColor = UIColor(red: 199/255, green: 6/255, blue: 22/255, alpha: 1.0)
        scannerButton.layer.cornerRadius = 5
        
        scannerButton.addTarget(self, action: #selector(launchXavier), for: .touchUpInside)
        
        scannerButton.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint2 = scannerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint2 = scannerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let widthConstraint2 = scannerButton.widthAnchor.constraint(lessThanOrEqualToConstant: 500)
        widthConstraint2.priority = .required
        let widthConstraint2ScreenSize = scannerButton.widthAnchor.constraint(equalToConstant: screenWidth - 40)
        widthConstraint2ScreenSize.priority = .defaultHigh
        let heightConstraint2 = scannerButton.heightAnchor.constraint(equalToConstant: 50)
        
        self.view.addConstraints([horizontalConstraint2, verticalConstraint2, widthConstraint2, widthConstraint2ScreenSize, heightConstraint2])
        
        self.view.addSubview(footerView)
        footerView.text = "\u{A9} BlackShark Tech"
        footerView.textAlignment = .center
        footerView.textColor = UIColor.white
        footerView.backgroundColor = UIColor.black
        footerView.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint3 = footerView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint3 = footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        let widthConstraint3 = footerView.widthAnchor.constraint(equalToConstant: screenWidth)
        let heightConstraint3 = footerView.heightAnchor.constraint(equalToConstant: 50)
        
        self.view.addConstraints([horizontalConstraint3, verticalConstraint3, widthConstraint3, heightConstraint3])
    }

    // MARK: Button Functions
    @objc func showInfo() {
        self.navigationController?.pushViewController(TopTabBarController(), animated: true)
    }
    
    @objc func launchXavier() {
        let mrzScanner = MRZScanner()
        mrzScanner.start(self, licenseKey: "LICENSE_KEY_HERE")
    }
    
    // MARK: XavierDelegate Functions
    func handleResults(results: ParsedMRZ) {
        let resultsVC = ResultsViewController(parsedMRZ: results)
        resultsVC.modalPresentationStyle = .fullScreen
        
        let navC = CustomNavigationController()
        navC.viewControllers = [resultsVC]
        navC.navigationBar.isTranslucent = false
        navC.navigationBar.barTintColor = UIColor(red: 199/255, green: 6/255, blue: 22/255, alpha: 1.0)
        
        resultsVC.pictureView.imgPhoto.image = results.documentImage
        navC.modalPresentationStyle = .fullScreen
        
        self.present(navC, animated: true, completion: nil)
    }
    
    func scanCancelled() {
        print("scan cancelled")
    }
}

