//
//  ContactViewController.swift
//  XavierDemoiOS
//
//  Created by Wilson Rhodes on 10/22/18.
//  Copyright © 2018 Blackshark Tech. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ContactViewController: UIViewController, IndicatorInfoProvider {
    var parentScrollView: UIScrollView = UIScrollView()
    
    var toBuyLabel: UILabel = UILabel()
    var toBuyTextView: UITextView = UITextView()
    var moreInfoLabel: UILabel = UILabel()
    var moreInfoTextView: UITextView = UITextView()
    var rateUsLabel: UILabel = UILabel()
    var rateUsTextView: UILabel = UILabel()
    var rateUsButton: UIButton = UIButton(type: UIButton.ButtonType.roundedRect)
    
    let HEADER_TEXT_SIZE: CGFloat = 24
    let BODY_TEXT_SIZE: CGFloat = 18
    
    var HEADER_FONT: UIFont!
    var BODY_FONT: UIFont!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Standard Fonts
        self.HEADER_FONT = UIFont(name: "Arial-BoldMT", size: HEADER_TEXT_SIZE) ?? UIFont.systemFont(ofSize: HEADER_TEXT_SIZE)
        self.BODY_FONT = UIFont(name: "ArialMT", size: BODY_TEXT_SIZE)
        
        self.view.backgroundColor = UIColor.white
        
        let screenWidth = UIScreen.main.bounds.width
        
        // Add Parent Scroll View
        self.view.addSubview(parentScrollView)
        parentScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = parentScrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = parentScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10)
        let widthConstraint = parentScrollView.widthAnchor.constraint(equalToConstant: screenWidth - 20)
        let heightConstraint = parentScrollView.heightAnchor.constraint(equalToConstant: self.view.frame.height)
        
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
        // Add Sections
        self.createToBuySection()

        self.createMoreInfoSection()
        
        self.createRateUsSection()
        
    }
    
    func createToBuySection() -> Void {
        // Section Header
        toBuyLabel.textAlignment = .center
        toBuyLabel.font = HEADER_FONT
        toBuyLabel.text = "To Buy"
        toBuyLabel.textColor = UIColor.black
        toBuyLabel.sizeToFit()
        
        setConstraints(parentView: parentScrollView, subView: toBuyLabel, topAnchor: parentScrollView.topAnchor, widthAnchor: parentScrollView.widthAnchor)
        
        // Section Separator
        let separator = addSeparatorLine(below: toBuyLabel, image: UIImage(named: "icMoney")!)
        
        // Section Body
        toBuyTextView.dataDetectorTypes = .all
        toBuyTextView.text = "Interested in having Xavier in your app? Email us at info@blacksharktech.com for pricing and license inquiries."
        toBuyTextView.font = BODY_FONT
        toBuyTextView.textColor = UIColor.black
        toBuyTextView.backgroundColor = UIColor.white
        toBuyTextView.isEditable = false
        toBuyTextView.isScrollEnabled = false
        toBuyTextView.textAlignment = .center
        toBuyTextView.sizeToFit()
        toBuyTextView.layoutSubviews()
        
        setConstraints(parentView: parentScrollView, subView: toBuyTextView, topAnchor: separator.bottomAnchor, widthAnchor: parentScrollView.widthAnchor)
    }
    
    func createMoreInfoSection() -> Void {
        // Section Header
        moreInfoLabel.textAlignment = .center
        moreInfoLabel.font = HEADER_FONT
        moreInfoLabel.text = "More Info"
        moreInfoLabel.textColor = UIColor.black
        moreInfoLabel.sizeToFit()
        
        setConstraints(parentView: parentScrollView, subView: moreInfoLabel, topAnchor: toBuyTextView.bottomAnchor, widthAnchor: parentScrollView.widthAnchor)
        
        // Section Separator
        let separator = addSeparatorLine(below: moreInfoLabel, image: UIImage(named: "icGlobe")!)
        
        parentScrollView.addSubview(moreInfoTextView)
        
        moreInfoTextView.dataDetectorTypes = .all
        moreInfoTextView.text = "Visit our website at blacksharktech.com."
        moreInfoTextView.font = UIFont(name: "ArialMT", size: 18)
        moreInfoTextView.textColor = UIColor.black
        moreInfoTextView.backgroundColor = UIColor.white
        moreInfoTextView.isEditable = false
        moreInfoTextView.isScrollEnabled = false
        moreInfoTextView.textAlignment = .center
        moreInfoTextView.sizeToFit()
        moreInfoTextView.layoutSubviews()
        
        setConstraints(parentView: parentScrollView, subView: moreInfoTextView, topAnchor: separator.bottomAnchor, widthAnchor: parentScrollView.widthAnchor)
    }
    
    func createRateUsSection() -> Void {
        // Section Header
        rateUsLabel.textAlignment = .center
        rateUsLabel.font = HEADER_FONT
        rateUsLabel.text = "Rate Us!"
        rateUsLabel.textColor = UIColor.black
        rateUsLabel.sizeToFit()
        
        setConstraints(parentView: parentScrollView, subView: rateUsLabel, topAnchor: moreInfoTextView.bottomAnchor, widthAnchor: parentScrollView.widthAnchor)
        
        // Section Separator
        let separator = addSeparatorLine(below: rateUsLabel, image: UIImage(named: "icStar")!)
        
        // Section Body
        rateUsTextView.textAlignment = .center
        rateUsTextView.numberOfLines = 0
        rateUsTextView.font = BODY_FONT
        rateUsTextView.text = "Enjoying our app? Rate us on the app store!"
        rateUsTextView.textColor = UIColor.black
        
        setConstraints(parentView: parentScrollView, subView: rateUsTextView, topAnchor: separator.bottomAnchor, widthAnchor: parentScrollView.widthAnchor)
        
        // Rate Button
        rateUsButton.setAttributedTitle(NSMutableAttributedString(string: "Click Here to Rate", attributes: [NSAttributedString.Key.font : BODY_FONT, NSAttributedString.Key.foregroundColor : UIColor.white]), for: .normal)
        rateUsButton.layer.cornerRadius = 5
        rateUsButton.translatesAutoresizingMaskIntoConstraints = false
        rateUsButton.backgroundColor = UIColor(red: 199/255, green: 6/255, blue: 22/255, alpha: 1.0)
        
        rateUsButton.addTarget(self, action: #selector(self.rateUsButtonClicked(_:)), for: .touchUpInside)

        parentScrollView.addSubview(rateUsButton)
        let horizontalConstraint = rateUsButton.centerXAnchor.constraint(equalTo: parentScrollView.centerXAnchor)
        let verticalConstraint = rateUsButton.topAnchor.constraint(equalTo: rateUsTextView.bottomAnchor, constant: 10)
        let widthConstraint = rateUsButton.widthAnchor.constraint(equalToConstant: 200)
        let heightConstraint = rateUsButton.heightAnchor.constraint(equalToConstant: 40)
        parentScrollView.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
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
        return IndicatorInfo(title: "CONTACT/PURCHASE")
    }
    
    @objc func rateUsButtonClicked(_ sender: Any) {
        rateApp(appId: "id1199671675")
    }
    
    fileprivate func rateApp(appId: String) {
        openUrl("itms-apps://itunes.apple.com/app/" + appId)
    }
    
    fileprivate func openUrl(_ urlString:String) {
        let url = URL(string: urlString)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}

func setConstraints(parentView: UIView, subView: UIView, topAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, widthAnchor: NSLayoutAnchor<NSLayoutDimension>) {
    
    subView.translatesAutoresizingMaskIntoConstraints = false
    parentView.addSubview(subView)
    
    let horizontalConstraint = subView.centerXAnchor.constraint(equalTo: parentView.centerXAnchor)
    let verticalConstraint = subView.topAnchor.constraint(equalTo: topAnchor, constant: 10)
    let widthConstraint = subView.widthAnchor.constraint(equalTo: widthAnchor)
    
    parentView.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint])
    
}
