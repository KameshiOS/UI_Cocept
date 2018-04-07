//
//  QRSignUpViewController.swift
//  Payzak
//
//  Created by Lalithbabu Logeshwarrao on 19/07/2017.
//  Copyright © 2017 Payzak Financial Service. All rights reserved.
//

import UIKit
import TextFieldEffects

class QRSignUpViewController: UIViewController, XMLParserDelegate  {

    @IBOutlet weak var countryTF: HoshiTextField!
    @IBOutlet weak var stateTF: HoshiTextField!
    @IBOutlet weak var pincodeTF: HoshiTextField!
    @IBOutlet weak var postOfficeTF: HoshiTextField!
    @IBOutlet weak var districtTF: HoshiTextField!
    @IBOutlet weak var talukTF: HoshiTextField!
    @IBOutlet weak var villageTF: HoshiTextField!
    @IBOutlet weak var doorNoTF: HoshiTextField!
    @IBOutlet weak var dateOFBirthTF: HoshiTextField!
    @IBOutlet weak var genderTF: HoshiTextField!
    @IBOutlet weak var nameTF: HoshiTextField!
    
    var qrOutput: [String: String] = [:]
    var xmlOutput = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(xmlOutput)
        let xmlData = xmlOutput.data(using: .utf8)
        let parser = XMLParser(data: xmlData!)
        parser.delegate = self
        
        parser.parse()
    }

    /*
 ["state": "Tamil Nadu", "pc": "635203", "name": "Aravind", "dist": "Krishnagiri", "house": "225", "subdist": "Pochampalli", "street": "KANNANDAALLI", "po": "Kannandahalli", "gender": "M", "uid": "956368062847", "yob": "1995", "vtc": "Kannandahalli", "lm": "KANNANDAALLI", "co": "S/O: Rajagopal", "loc": "POCHAMPALLI", "dob": "1995-03-08"]
 Optional("Aravind")
 */
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        print(attributeDict)
        nameTF.text = attributeDict["name"]
        if attributeDict["gender"] == "M" {
            genderTF.text = "Male"
        } else if attributeDict["gender"] == "F" {
            genderTF.text = "Female"
        } else {
            genderTF.text = "Other"
        }
        dateOFBirthTF.text = attributeDict["dob"]
        doorNoTF.text = attributeDict["house"]
        villageTF.text = attributeDict["vtc"]
        talukTF.text = attributeDict["subdist"]
        districtTF.text = attributeDict["dist"]
        postOfficeTF.text = attributeDict["po"]
        pincodeTF.text = attributeDict["pc"]
        stateTF.text = attributeDict["state"]
        countryTF.text = "India"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
