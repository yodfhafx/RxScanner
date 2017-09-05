//
//  barcodeViewController.swift
//  rxScan
//
//  Created by Yodfha on 8/1/2559 BE.
//  Copyright © 2559 Fhasai. All rights reserved.
//

import UIKit

class barcodeViewController: UIViewController, BarcodeDelegate {
    
    @IBOutlet weak var codeTextView: UILabel!
    
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
//    @IBOutlet weak var showCodeLabel: UILabel!
    @IBOutlet weak var barcodeLabel: UILabel!
    @IBOutlet weak var orderbygroup: UILabel!
    

    var episode: Episode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if(codeTextView != nil)
//        {
//            for (key,subJson):(String, JSON) in json {
//                
//                codeTextView.text = episode.barcode
//                titleLabel.text = episode.title
//                drugLabel.text = episode.drug
//                priceLabel.text = episode.price
//            }
//            
//        }
//        titleLabel.text = episode.title
//        drugLabel.text = episode.drug
//        patternLabel.text = episode.pattern
//        propertiesLabel.text = episode.properties
//        usageLabel.text = episode.usage
//        warningLabel.text = episode.warning
//        keepLabel.text = episode.keep
//        companyLabel.text = episode.company
//        priceLabel.text = episode.price
//        groupLabel.text = episode.group
//        
//        if episode.thumbnailURL != nil {
//            
//            if let thumbnailURL = episode.thumbnailURL {
//                let networkService = NetworkService(url: thumbnailURL)
//                networkService.downloadImage({ (data) in
//                    //thumbnailImageView.image = episode.thumbnailURL
//                    let image = UIImage(data: data)
//                    dispatch_async(dispatch_get_main_queue(), {
//                        self.thumbnailImageView.image = image
//                    })
//                })
//
//        
//        
//        }
//    
//        }
//        else {
//            thumbnailImageView.image = UIImage(named:  "line")
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("Segue!")
        
        let barcodeViewController: barcodeCapViewController = segue.destinationViewController as! barcodeCapViewController
        barcodeViewController.delegate = self
        
    }
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
//        let data = NSData(contentsOfURL: episode.thumbnailURL!)
//        let image = UIImage(data: data!)
//        thumbnailImageView.image = image
    
//        let data = NSData(contentsOfURL: episode.thumbnailURL!)
//        thumbnailImageView.image = UIImage(data: data!)
    
        func barcodeReaded(barcode: String) {
        print("Barcode is: \(barcode)")
        barcodeLabel.text = barcode
        let episodes = Episode.downloadAllEpisodes()
        var filteredEpisodes = episodes.filter({ $0.barcode == barcode })
        if filteredEpisodes.count > 0 {
         
            
            titleLabel.text = filteredEpisodes[0].title
            drugLabel.text = filteredEpisodes[0].drug
            price1Label.text = filteredEpisodes[0].price1
            price2Label.text = filteredEpisodes[0].price2
            effectLabel.text = filteredEpisodes[0].effect
            keepLabel.text = filteredEpisodes[0].keep
            companyLabel.text = filteredEpisodes[0].company
            warningLabel.text = filteredEpisodes[0].warning
            usageLabel.text = filteredEpisodes[0].usage
            propertiesLabel.text = filteredEpisodes[0].properties
            patternLabel.text = filteredEpisodes[0].pattern
            orderbygroup.text = filteredEpisodes[0].orderbygroup
            
            //thumbnailImageView.image = filteredEpisodes[0].thumbnailURL
            
//            if episode.thumbnailURL != nil {
//                
//                if let thumbnailURL = episode.thumbnailURL {
//                    let networkService = NetworkService(url: thumbnailURL)
//                    networkService.downloadImage({ (data) in
//                        //thumbnailImageView.image = episode.thumbnailURL
//                        let image = UIImage(data: data)
//                        dispatch_async(dispatch_get_main_queue(), {
//                            self.thumbnailImageView.image = image
//                        })
//                    })
//                }
//                
//                
//                
//            }
//            else {
//                thumbnailImageView.image = UIImage(named:  "loading")
//            }
            
            

            
            }
    }
    
    
    
    
    



//        if(showCodeLabel.text == "8851019030630")
//        {
//            titleLabel.text = "parasetamol"
//            priceLabel.text = "100"
//        }
//        else{
//            print("not have")
//        }
        
        
//        showCodeLabel.text = episode.testCode
//        if((episode.testCode) != nil)
//        {
//            titleLabel.text = episode.title
//            drugLabel.text = episode.drug
//            priceLabel.text = episode.price
//        }
        
    
    
//    func barcodeReaded(barcode: String) {
//        print("Barcode is: \(barcode)")
//        codeTextView.text = barcode
    
//        if(codeTextView == episode.barcode)
//        {
//            titleLabel.text = episode.title
//            drugLabel.text = episode.drug
//            priceLabel.text = episode.price
//            codeTextView.text = episode.barcode
//        }

    
    
    
    //    func showName (name: String){
    //        if (codeTextView == 8850678063010) {
    //            print("Name1: \(name)")
    //            codeTextView.text = name
    //        } else if (codeTextView == 8850075001707) {
    //            print("Name2: \(name)")
    //            codeTextView.text = name
    //        }
    //    }
}
