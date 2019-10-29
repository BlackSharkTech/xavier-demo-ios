//
//  ResultsViewController.swift
//  XavierDemoiOS
//
//  Created by Wilson Rhodes on 9/27/18.
//  Copyright © 2018 Blackshark Tech. All rights reserved.
//

import UIKit
import XavierFramework

class ResultsViewController: UIViewController{
    
    var parsedMRZ = ParsedMRZ()
    
    var mrzDisplayLabel: UILabel = UILabel()
    var scanTimeLabel: UILabel = UILabel()
    var documentTypeLabel: UILabel = UILabel()
    var documentNumberLabel: UILabel = UILabel()
    var sexLabel: UILabel = UILabel()
    var givenNameLabel: UILabel = UILabel()
    var surnameLabel: UILabel = UILabel()
    var countryCitizenLabel: UILabel = UILabel()
    var countryIssueLabel: UILabel = UILabel()
    var dateExpirationLabel: UILabel = UILabel()
    var dateBirthLabel: UILabel = UILabel()
    var optionalDataLabel: UILabel = UILabel()
    var optionalData2Label: UILabel = UILabel()
    var docNumCheckDigitLabel: UILabel = UILabel()
    var dateExpCheckDigitLabel: UILabel = UILabel()
    var dateBirthCheckDigitLabel: UILabel = UILabel()
    var optionalDataCheckDigitLabel: UILabel = UILabel()
    var compositeCheckDigitLabel: UILabel = UILabel()
    
    var pictureView = PhotoDetailViewController()
    var filteredPicture = UIImage()
    
    var resultsScrollView = UIScrollView()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        fatalError("init(coder:) has not been implemented")
    }
    
    init(parsedMRZ: ParsedMRZ){
        self.parsedMRZ = parsedMRZ
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.title = "Results"
        
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        
        self.view.addSubview(pictureView.view)
        
        pictureView.view.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint2 = pictureView.view.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint2 = pictureView.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 10)
        let widthConstraint2 = pictureView.view.widthAnchor.constraint(equalToConstant: screenWidth - 20)
        let heightConstraint2 = pictureView.view.heightAnchor.constraint(equalToConstant: screenHeight/3)
        view.addConstraints([horizontalConstraint2, verticalConstraint2, widthConstraint2, heightConstraint2])
        
        self.view.addSubview(resultsScrollView)
        
        resultsScrollView.layer.borderColor = UIColor.black.cgColor
        resultsScrollView.layer.borderWidth = 1.0
        resultsScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = resultsScrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = resultsScrollView.topAnchor.constraint(equalTo: pictureView.view.bottomAnchor, constant: 10)
        let widthConstraint = resultsScrollView.widthAnchor.constraint(equalToConstant: screenWidth - 20)
        let heightConstraint = resultsScrollView.heightAnchor.constraint(equalToConstant: screenHeight - screenHeight/3 - 100)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
        resultsScrollView.addSubview(scanTimeLabel)
        
        scanTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint1 = scanTimeLabel.leadingAnchor.constraint(equalTo: resultsScrollView.leadingAnchor, constant: 5)
        let verticalConstraint1 = scanTimeLabel.topAnchor.constraint(equalTo: resultsScrollView.topAnchor, constant: 5)
        let widthConstraint1 = scanTimeLabel.widthAnchor.constraint(equalToConstant: screenWidth - 20)
        view.addConstraints([horizontalConstraint1, verticalConstraint1, widthConstraint1])
        
        scanTimeLabel.numberOfLines = 0
        let boldedTitle = NSMutableAttributedString(string: "Total Scan Time:", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.foregroundColor: UIColor.black])
        let nonBoldedData = NSMutableAttributedString(string: " " + String(Double(round(1000*parsedMRZ.totalScanTime)/1000)) + "s", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        boldedTitle.append(nonBoldedData)
        
        scanTimeLabel.attributedText = boldedTitle
        
        addLabelBelow(topLabel: scanTimeLabel, labelToAdd: mrzDisplayLabel, labelTitle: "Raw MRZ:", labelData: "\n" + parsedMRZ.rawMRZ)
        addLabelBelow(topLabel: mrzDisplayLabel, labelToAdd: documentTypeLabel, labelTitle: "Document Type:", labelData: parsedMRZ.documentType)
        addLabelBelow(topLabel: documentTypeLabel, labelToAdd: documentNumberLabel, labelTitle: "Document Number:", labelData: parsedMRZ.documentNumber)
        addLabelBelow(topLabel: documentNumberLabel, labelToAdd: sexLabel, labelTitle: "Sex:", labelData: parsedMRZ.sex)
        addLabelBelow(topLabel: sexLabel, labelToAdd: dateBirthLabel, labelTitle: "DOB:", labelData: parsedMRZ.dateBirth)
        addLabelBelow(topLabel: dateBirthLabel, labelToAdd: givenNameLabel, labelTitle: "Given Name:", labelData: parsedMRZ.givenName)
        addLabelBelow(topLabel: givenNameLabel, labelToAdd: surnameLabel, labelTitle: "Surname:", labelData: parsedMRZ.surname)
        addLabelBelow(topLabel: surnameLabel, labelToAdd: countryCitizenLabel, labelTitle: "Country of Citizenship:", labelData: parsedMRZ.countryCitizen)
        addLabelBelow(topLabel: countryCitizenLabel, labelToAdd: countryIssueLabel, labelTitle: "Document Issue Country:", labelData: parsedMRZ.countryIssue)
        addLabelBelow(topLabel: countryIssueLabel, labelToAdd: dateExpirationLabel, labelTitle: "Date of Expiration:", labelData: parsedMRZ.dateExpiration)
        addLabelBelow(topLabel: dateExpirationLabel, labelToAdd: optionalDataLabel, labelTitle: "Optional Data:", labelData: parsedMRZ.optionalData)
        addLabelBelow(topLabel: optionalDataLabel, labelToAdd: optionalData2Label, labelTitle: "Optional Data 2:", labelData: parsedMRZ.optionalData2)
        addLabelBelow(topLabel: optionalData2Label, labelToAdd: docNumCheckDigitLabel, labelTitle: "Document Number Check Digit:", labelData: parsedMRZ.documentNumberCheckDigit)
        addLabelBelow(topLabel: docNumCheckDigitLabel, labelToAdd: dateExpCheckDigitLabel, labelTitle: "Date of Expiration Check Digit:", labelData: parsedMRZ.dateExpirationCheckDigit)
        addLabelBelow(topLabel: dateExpCheckDigitLabel, labelToAdd: dateBirthCheckDigitLabel, labelTitle: "Date of Birth Check Digit:", labelData: parsedMRZ.dateBirthCheckDigit)
        addLabelBelow(topLabel: dateBirthCheckDigitLabel, labelToAdd: optionalDataCheckDigitLabel, labelTitle: "Optional Data Check Digit:", labelData: parsedMRZ.optionalDataCheckDigit)
        addLabelBelow(topLabel: optionalDataCheckDigitLabel, labelToAdd: compositeCheckDigitLabel, labelTitle: "Composite Check Digit:", labelData: parsedMRZ.compositeCheckDigit)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.stop, target: self, action: #selector(dismissVC))
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        scanTimeLabel.sizeToFit()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //set scroll view size
        var contentRect = CGRect.zero
        
        for view in resultsScrollView.subviews {
            contentRect = contentRect.union(view.frame)
        }
        
        let noHorizontalScrolling = CGSize(width: resultsScrollView.frame.width, height: contentRect.height)
        resultsScrollView.contentSize = noHorizontalScrolling
    }
    
    @objc func dismissVC(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func addLabelBelow(topLabel: UILabel, labelToAdd: UILabel, labelTitle: String, labelData: String){
        let screenWidth = UIScreen.main.bounds.width
        
        let boldedTitle = NSMutableAttributedString(string: labelTitle, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.foregroundColor: UIColor.black])
        let nonBoldedData = NSMutableAttributedString(string: " " + labelData, attributes: [NSAttributedString.Key.font : UIFont(name: "Courier", size: 18) ?? UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.black])
        boldedTitle.append(nonBoldedData)
        
        labelToAdd.attributedText = boldedTitle
        resultsScrollView.addSubview(labelToAdd)
        
        labelToAdd.translatesAutoresizingMaskIntoConstraints = false
        labelToAdd.numberOfLines = 0
        
        let horizontalConstraint = labelToAdd.leadingAnchor.constraint(equalTo: resultsScrollView.leadingAnchor, constant: 5)
        let verticalConstraint = labelToAdd.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 10)
        let widthConstraint = labelToAdd.widthAnchor.constraint(equalToConstant: screenWidth - 25)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint])
        
        labelToAdd.sizeToFit()
    }
}

class PhotoDetailViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollView = UIScrollView()
    var imgPhoto = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.addSubview(scrollView)
        
        scrollView.layer.borderColor = UIColor.black.cgColor
        scrollView.layer.borderWidth = 1.0
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 8.0
        scrollView.delegate = self
        scrollView.alwaysBounceVertical = false
        scrollView.alwaysBounceHorizontal = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.flashScrollIndicators()
        
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
        }
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        let widthConstraint = scrollView.widthAnchor.constraint(equalTo: view.widthAnchor)
        let heightConstraint = scrollView.heightAnchor.constraint(equalTo: view.heightAnchor)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
        scrollView.addSubview(imgPhoto)
        
        imgPhoto.contentMode = .scaleAspectFit
        imgPhoto.clipsToBounds = true
        
        imgPhoto.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint1 = imgPhoto.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        let widthConstraint1 = imgPhoto.widthAnchor.constraint(equalTo: view.widthAnchor)
        let heightConstraint1 = imgPhoto.heightAnchor.constraint(equalTo: view.heightAnchor)
        view.addConstraints([horizontalConstraint1, widthConstraint1, heightConstraint1])
        
        //set scroll view size
        var contentRect = CGRect.zero
        
        for view in scrollView.subviews {
            contentRect = contentRect.union(view.frame)
        }
        scrollView.contentSize = contentRect.size
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgPhoto
    }
}
