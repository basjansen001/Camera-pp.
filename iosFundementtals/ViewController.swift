//
//  ViewController.swift
//  iosFundementtals
//
//  Created by Bas Jansen on 23-05-15.
//  Copyright (c) 2015 Bas Jansen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
    @IBOutlet weak var imageView: UIImageView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
    @IBAction func useCamera(sender: AnyObject) {
        let picker = UIImagePickerController()
		
        let sourceType = UIImagePickerControllerSourceType.Camera
		
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            picker.sourceType = sourceType
			
            let frontCamera = UIImagePickerControllerCameraDevice.Front
			
            if UIImagePickerController.isCameraDeviceAvailable(frontCamera) {
                picker.cameraDevice = frontCamera
	        picker.delegate = self
	        self.presentViewController(picker, animated: true, completion: nil)
            }
        }
    }
	
    @IBAction func openPhotoLibrary(sender: AnyObject) {
        let picker = UIImagePickerController()
		
        let sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            picker.sourceType = sourceType
            picker.delegate = self
            self.presentViewController(picker, animated: true, completion: nil)
        }
    }
	
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.imageView.image = image
		
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
	
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}

