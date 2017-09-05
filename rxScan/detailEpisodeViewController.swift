//
//  detailEpisodeViewController.swift
//  rxScan
//
//  Created by Yodfha on 9/5/2559 BE.
//  Copyright © 2559 Fhasai. All rights reserved.
//

import UIKit

class detailEpisodeViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var drugLabel: UILabel!
    @IBOutlet weak var patternLabel: UILabel!
    @IBOutlet weak var propertiesLabel: UILabel!
    @IBOutlet weak var usageLabel: UILabel!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var keepLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var effectLabel: UILabel!
    @IBOutlet weak var price1Label: UILabel!
    @IBOutlet weak var price2Label: UILabel!
    @IBOutlet weak var orderbygroup: UILabel!
    
    
    
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    
    var episode: Episode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 6.0//maximum zoom scale you want
       
        
        //ScrollView.contentSize.height = 1000
        
        titleLabel.text = episode.title
        drugLabel.text = episode.drug
        patternLabel.text = episode.pattern
        propertiesLabel.text = episode.properties
        usageLabel.text = episode.usage
        warningLabel.text = episode.warning
        keepLabel.text = episode.keep
        companyLabel.text = episode.company
        price1Label.text = episode.price1
        price2Label.text = episode.price2
        orderbygroup.text = episode.orderbygroup
        
        effectLabel.text = episode.effect
        
        if episode.thumbnailURL != nil {
            
            if let thumbnailURL = episode.thumbnailURL {
                let networkService = NetworkService(url: thumbnailURL)
                networkService.downloadImage({ (data) in
                    //thumbnailImageView.image = episode.thumbnailURL
                    let image = UIImage(data: data)
                    dispatch_async(dispatch_get_main_queue(), {
                        self.thumbnailImageView.image = image
                    })
                })
            }
            
            
            
        }
        else {
            thumbnailImageView.image = UIImage(named:  "load")
        }
        
    }
  
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "present" {
            if let myVC = segue.destinationViewController as? PresentViewController {
              myVC.newImage = thumbnailImageView.image
                
            }
        }
    }
  
    
    
   

    
}
