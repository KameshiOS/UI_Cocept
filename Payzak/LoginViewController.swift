//
//  LoginViewController.swift
//  Payzak
//
//  Created by Lalithbabu Logeshwarrao on 03/07/2017.
//  Copyright © 2017 Payzak Financial Service. All rights reserved.
//

import UIKit
import LocalAuthentication
import QuartzCore
import AVFoundation

class LoginViewController: UIViewController {

    @IBOutlet weak var usingTouchIDLabel: UILabel!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var fingerPrintButton: UIButton!
    
    let authenticationContext = LAContext()
    var error: NSError?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        if authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            fingerPrintButton.isHidden = false
            orLabel.isHidden = false
            usingTouchIDLabel.isHidden = false
           fingerPrintButton.setBackgroundImage(UIImage(named: "failure.png"), for: .normal)
        } else {
            fingerPrintButton.isHidden = true
            orLabel.isHidden = true
            usingTouchIDLabel.isHidden = true
        }
    }

    @IBAction func TouchIDAuthentication(_ sender: Any) {
       
        if authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // Touch ID, Navigate to success VC, Handling errors
            authenticationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Scan Your Finger print to authenticate", reply: { (success, error1) in
                DispatchQueue.main.async {
                    if success {
                        // Navigate to Dashboard
                       
                            UIView.animate(withDuration: 5, delay: 1, options: .curveEaseIn, animations: {
                                self.fingerPrintButton.setBackgroundImage(UIImage(named: "success.png"), for: .normal)
                            }, completion: { (true) in
                                self.performSegue(withIdentifier: "toDashboard", sender: nil)
                            })
                        
                        
                        
                    } else {
                        if let Error = error1 as NSError? {
                            if Error.code == LAError.userFallback.rawValue {
                                // Enter Passcode
                                print("User Fallback Code: \(Error.code)")
                                
                            } else if Error.code == LAError.userCancel.rawValue {
                                print("User Canceled Code: \(Error.code)")
                            } else {
                            let msg = self.errorMessageForLAErrorCode(errorCode: Error.code)
                            self.alert(alertMsg: msg)
                            }
                        }
                    }
                }
            })
        } else {
            // Open settings to register Touch ID
            print("No Finger print available")
            print(error)
            print(error?.code)
            let msg = self.errorMessageForLAErrorCode(errorCode: (error?.code)!)
            self.alert(alertMsg: msg)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func errorMessageForLAErrorCode(errorCode: Int) -> String {
        var message = ""
        
        switch errorCode {
        case LAError.appCancel.rawValue:
            message = "Authentication was cancelled by application"
            
        case LAError.authenticationFailed.rawValue:
            message = "The User failed to provide valid credentials"
            
        case LAError.invalidContext.rawValue:
            message = "The Context is Invalid"
            
        case LAError.passcodeNotSet.rawValue:
            message = "Passcode is not set on the device"
            
        case LAError.systemCancel.rawValue:
            message = "Authentication was cancelled by the system"
            
        case LAError.touchIDLockout.rawValue:
            message = "Too many failed attempts"       // For too many failed attempts.
            
        case LAError.touchIDNotAvailable.rawValue:
            message = "Touch ID is not available on the device"
            
        case LAError.userCancel.rawValue:
            message = "User did cancel"                     // on clicking cancel button
            
        case LAError.userFallback.rawValue:
            message = "The user choose to use fallback"    // enter password
            
        case LAError.touchIDNotEnrolled.rawValue:
            message = "Touch Id Not enrolled"              // No Finger Print is enrolled with touch ID
            
        default:
            message = "Did not find error code on LAError Object"
        }
        return message
    }
    
    func alert(alertMsg: String) {
        let alert = UIAlertController.init(title: "Alert!", message: alertMsg, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
