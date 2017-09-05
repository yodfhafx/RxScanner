//
//  EpisodeTableViewCell.swift
//  rxScan
//
//  Created by Yodfha on 9/5/2559 BE.
//  Copyright © 2559 Fhasai. All rights reserved.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {
    
    var episode: Episode! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        // TODO: download thumbnail image here
        if let thumbnailURL = episode.thumbnailURL {
            let networkService = NetworkService(url: thumbnailURL)
            networkService.downloadImage({ (data) in
                //let image = UIImage(data: data)
                
                dispatch_async(dispatch_get_main_queue(), {
                    //self.thumbnailImageView.image = image
                })
            })
        }
        
        
        
        titleLabel.text = episode.title
        orderbymixLabel.text  = episode.orderbymix
        
        
    }
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var drugLabel: UILabel!
    @IBOutlet weak var effectLabel: UILabel!
    @IBOutlet weak var orderbymixLabel: UILabel!
    @IBOutlet weak var orderbysystem: UILabel!
    @IBOutlet weak var orderbylaw: UILabel!
    
}
