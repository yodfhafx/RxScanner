//
//  PresentViewController.swift
//  rxScan
//
//  Created by Yodfha on 8/28/2560 BE.
//  Copyright © 2560 Fhasai. All rights reserved.
//

import UIKit

class PresentViewController: UIViewController, UIScrollViewDelegate {

    var episode: Episode!
    var newImage: UIImage!
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.image = newImage
        
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 6.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imgView
    }
    
    @IBAction func closeBtn() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


}
