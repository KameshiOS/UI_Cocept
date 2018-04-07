//
//  KYCVerificationViewController.swift
//  Payzak
//
//  Created by Lalithbabu Logeshwarrao on 21/07/2017.
//  Copyright © 2017 Payzak Financial Service. All rights reserved.
//

import UIKit
import AVFoundation

class KYCVerificationViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

    
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    @IBOutlet var qrView: ViewAnimation!
    
    var blurView: UIVisualEffectView!
    var blurEffect : UIVisualEffect!
    
    var output = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        qrView.backgroundColor = UIColor.black
        captureSession = AVCaptureSession()
        
        let videoCaptureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            print("Video Input Error")
            return
        }
        
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if captureSession.canAddOutput(metadataOutput) {
            captureSession.addOutput(metadataOutput)
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
        } else {
            failed()
            return
        }
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        qrView.layer.addSublayer(previewLayer)
        
        captureSession.startRunning()

    }
    func failed() {
        let ac = UIAlertController(title: "Scanning not Supported", message: "Your Device does not support scanning a code from an item. Please use a device with a camera", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(ac, animated: true, completion: nil)
        captureSession = nil
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if captureSession.isRunning == false {
            captureSession.startRunning()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if captureSession.isRunning == true {
            captureSession.stopRunning()
        }
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        captureSession.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            let readableObject = metadataObject as! AVMetadataMachineReadableCodeObject
            
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            AudioServicesPlayAlertSound(.max)
            found(code: readableObject.stringValue)
        }
        //dismiss(animated: true, completion: nil)
    }
    func found(code: String) {
        let alert = UIAlertController.init(title: "Success", message: "Your Aadhaar card scanned successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
            
            DispatchQueue.main.async {
                self.output = code
                self.performSegue(withIdentifier: "QRRegister", sender: nil)
                self.animateOut()
            }
        }))
        present(alert, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "QRRegister" {
            let destVC = segue.destination as! QRSignUpViewController
            destVC.xmlOutput = self.output
        }
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func ScanQRButtonAction(_ sender: Any) {
        animationIn()
    }
    func animationIn() {
        
        blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds
        
        self.view.addSubview(blurView)
        
        // add item view over blur View
        let cancelButton = UIButton(frame: CGRect(x: self.blurView.layer.frame.width - 110, y: self.blurView.layer.frame.height - 50, width: 100, height: 30))
        cancelButton.tintColor = UIColor.white
        cancelButton.titleColor(for: .normal)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.addTarget(self, action: #selector(animateOut), for: .touchUpInside)
        blurView.addSubview(cancelButton)
        blurView.addSubview(self.qrView)
        //self.CreateTicketView.frame = CGRect(x: 0, y: 0, width: 300, height: 440)
        self.qrView.borderColor = UIColor.green
        self.qrView.borderWidth = 3
        self.qrView.center = blurView.center
        self.qrView.layer.cornerRadius = self.qrView.frame.size.width / 30
        self.qrView.clipsToBounds = true
        self.qrView.layer.borderWidth = 1
        self.qrView.layer.borderColor = UIColor.clear.cgColor
        self.qrView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        self.qrView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.blurView.effect = self.blurEffect
            self.qrView.alpha = 1
            self.qrView.transform = CGAffineTransform.identity
        }
    }
    func animateOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.qrView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.qrView.alpha = 0
            
            self.blurView.effect = nil
        }) { (success: Bool) in
            self.qrView.removeFromSuperview()
            self.blurView.removeFromSuperview()
        }
    }
}
