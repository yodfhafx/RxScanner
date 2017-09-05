//
//  barcodeCapViewController.swift
//  rxScan
//
//  Created by Yodfha on 8/1/2559 BE.
//  Copyright © 2559 Fhasai. All rights reserved.
//

import UIKit
import AVFoundation

protocol BarcodeDelegate {
    func barcodeReaded(barcode: String)
}


class barcodeCapViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var delegate: BarcodeDelegate?
    var captureSession: AVCaptureSession!
    var code: String?
    @IBOutlet weak var cameraView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.captureSession = AVCaptureSession();
        
        let videoCaptureDevice: AVCaptureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        do {
            
            let videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
            
            if self.captureSession.canAddInput(videoInput) {
                self.captureSession.addInput(videoInput)
            } else {
                print("Could not add video input")
            }
            
            let metadataOutput = AVCaptureMetadataOutput()
            if self.captureSession.canAddOutput(metadataOutput) {
                self.captureSession.addOutput(metadataOutput)
                
                metadataOutput.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
                metadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code]
            } else {
                print("Could not add metadata output")
            }
            
            let previewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
            previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            previewLayer.frame = self.cameraView.frame
            self.view.layer .addSublayer(previewLayer)
            self.captureSession.startRunning()
        } catch let error as NSError {
            print("Error while creating vide input device: \(error.localizedDescription)")
        }
        
    }
    
//    override func viewDidAppear(animated: Bool) {
//        self.captureSession = AVCaptureSession();
//        
//                let videoCaptureDevice: AVCaptureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
//        
//                do {
//        
//                    let videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
//        
//                    if self.captureSession.canAddInput(videoInput) {
//                        self.captureSession.addInput(videoInput)
//                    } else {
//                        print("Could not add video input")
//                    }
//        
//                    let metadataOutput = AVCaptureMetadataOutput()
//                    if self.captureSession.canAddOutput(metadataOutput) {
//                        self.captureSession.addOutput(metadataOutput)
//        
//                        metadataOutput.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
//                        metadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code]
//                    } else {
//                        print("Could not add metadata output")
//                    }
//        
//                    let previewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
//                    previewLayer.frame = CGRectMake(2, 50, 500, 300)
//                    self.view.layer .addSublayer(previewLayer)
//                    self.captureSession.startRunning()
//                } catch let error as NSError {
//                    print("Error while creating vide input device: \(error.localizedDescription)")
//                }
//
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        for metadata in metadataObjects {
            let readableObject = metadata as! AVMetadataMachineReadableCodeObject
            let code = readableObject.stringValue
            if !code.isEmpty {
                self.captureSession.stopRunning()
                self.dismissViewControllerAnimated(true, completion: nil)
                self.delegate?.barcodeReaded(code)
            }
        }
    }
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    
}