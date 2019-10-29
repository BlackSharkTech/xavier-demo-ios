//
//  HowToViewController.swift
//  XavierDemoiOS
//
//  Created by Wilson Rhodes on 10/22/18.
//  Copyright © 2018 Blackshark Tech. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class HowToViewController: UIViewController, IndicatorInfoProvider {
    
    let parentScrollView = UIScrollView()
    
    var helpLabel: UILabel = UILabel()
    var helpText: UITextView = UITextView()

    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let screenWidth = UIScreen.main.bounds.width
        
        self.view.addSubview(parentScrollView)
        
        parentScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint5 = parentScrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint5 = parentScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10)
        let widthConstraint5 = parentScrollView.widthAnchor.constraint(equalToConstant: screenWidth - 20)
        let heightConstraint5 = parentScrollView.heightAnchor.constraint(equalToConstant: self.view.frame.height)
        
        view.addConstraints([horizontalConstraint5, verticalConstraint5, widthConstraint5, heightConstraint5])
        
        parentScrollView.addSubview(helpLabel)
        
        helpLabel.textAlignment = .center
        helpLabel.attributedText = NSMutableAttributedString(string: "Having trouble scanning?", attributes: [NSAttributedString.Key.font : UIFont(name: "Arial-BoldMT", size: 24) ?? UIFont.systemFont(ofSize: 24), NSAttributedString.Key.foregroundColor: UIColor.black])
        helpLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = helpLabel.centerXAnchor.constraint(equalTo: parentScrollView.centerXAnchor)
        let verticalConstraint = helpLabel.topAnchor.constraint(equalTo: parentScrollView.topAnchor, constant: 10)
        let widthConstraint = helpLabel.widthAnchor.constraint(equalTo: parentScrollView.widthAnchor)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint])
        
        helpLabel.sizeToFit()
        
        let separator1 = addSeparatorLine(below: helpLabel, image: UIImage(named: "icHelp")!)
        
        let label0 = addTip(viewAbove: separator1, tipText: "Make sure the MRZ is within the frame. The MRZ is on the bottom of Passports and Visas, and on the back of cards such as the Enhanced Driver's License or a U.S Permanent Resident Card.")
        let label1 = addTip(viewAbove: label0, tipText: "Make sure the document is centered within the bounds of the box.")
        let label2 = addTip(viewAbove: label1, tipText: "Reduce glare on your document by angling the document or blocking the offending light source.")
        let label3 = addTip(viewAbove: label2, tipText: "In dim lighting, enable the flashlight using the icon in the top right of the scanner screen.")
        let label4 = addTip(viewAbove: label3, tipText: "Move your document slowly in and out.")
        let label5 = addTip(viewAbove: label4, tipText: "Try landscape mode.")
        _ = addTip(viewAbove: label5, tipText: "Make sure your hand doesn't cover text on the document.")

    }
    
    func addSeparatorLine(below: UILabel, image: UIImage) -> UIView {
        let separatorView = UIView()
        
        parentScrollView.addSubview(separatorView)
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = separatorView.centerXAnchor.constraint(equalTo: parentScrollView.centerXAnchor)
        let verticalConstraint = separatorView.topAnchor.constraint(equalTo: below.bottomAnchor, constant: 10)
        let widthConstraint = separatorView.widthAnchor.constraint(equalTo: parentScrollView.widthAnchor)
        let heightConstraint = separatorView.heightAnchor.constraint(equalToConstant: 20)
        
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
        let leftLine = UIView()
        
        separatorView.addSubview(leftLine)
        
        leftLine.backgroundColor = UIColor(red: 199/255, green: 6/255, blue: 22/255, alpha: 1.0)
        leftLine.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint1 = leftLine.leftAnchor.constraint(equalTo: separatorView.leftAnchor)
        let verticalConstraint1 = leftLine.centerYAnchor.constraint(equalTo: separatorView.centerYAnchor)
        let widthConstraint1 = leftLine.widthAnchor.constraint(equalTo: separatorView.widthAnchor, multiplier: 0.5, constant: -25)
        let heightConstraint1 = leftLine.heightAnchor.constraint(equalToConstant: 3)
        
        view.addConstraints([horizontalConstraint1, verticalConstraint1, widthConstraint1, heightConstraint1])
        
        let rightLine = UIView()
        
        separatorView.addSubview(rightLine)
        rightLine.backgroundColor = UIColor(red: 199/255, green: 6/255, blue: 22/255, alpha: 1.0)
        rightLine.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint2 = rightLine.rightAnchor.constraint(equalTo: separatorView.rightAnchor)
        let verticalConstraint2 = rightLine.centerYAnchor.constraint(equalTo: separatorView.centerYAnchor)
        let widthConstraint2 = rightLine.widthAnchor.constraint(equalTo: separatorView.widthAnchor, multiplier: 0.5, constant: -25)
        let heightConstraint2 = rightLine.heightAnchor.constraint(equalToConstant: 3)
        
        view.addConstraints([horizontalConstraint2, verticalConstraint2, widthConstraint2, heightConstraint2])
        
        let centerImage = UIImageView()
        
        separatorView.addSubview(centerImage)
        
        centerImage.image = image
        centerImage.contentMode = .scaleAspectFit
        centerImage.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint3 = centerImage.leftAnchor.constraint(equalTo: leftLine.rightAnchor)
        let horizontalContraint4 = centerImage.rightAnchor.constraint(equalTo: rightLine.leftAnchor)
        let verticalConstraint3 = centerImage.centerYAnchor.constraint(equalTo: separatorView.centerYAnchor)
        let heightConstraint3 = centerImage.heightAnchor.constraint(equalToConstant: 30)
        
        view.addConstraints([horizontalConstraint3, horizontalContraint4, verticalConstraint3, heightConstraint3])
        
        return separatorView
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "TIPS & TRICKS")
    }
    
    func addTip(viewAbove: UIView, tipText: String) -> UILabel{
        let tipLabel = UILabel()
        
        self.view.addSubview(tipLabel)
        
        tipLabel.textAlignment = .left
        tipLabel.numberOfLines = 0
        tipLabel.attributedText = NSMutableAttributedString(string: "\u{2022} " + tipText, attributes: [NSAttributedString.Key.font : UIFont(name: "ArialMT", size: 18) ?? UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.black])
        tipLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = tipLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = tipLabel.topAnchor.constraint(equalTo: viewAbove.bottomAnchor, constant: 10)
        let widthConstraint = tipLabel.widthAnchor.constraint(equalToConstant: screenWidth - 30)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint])
        
        tipLabel.sizeToFit()
        
        return tipLabel
    }
}
