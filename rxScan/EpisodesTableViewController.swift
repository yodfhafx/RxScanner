//
//  EpisodesTableViewController.swift
//  rxScan
//
//  Created by Yodfha on 9/5/2559 BE.
//  Copyright © 2559 Fhasai. All rights reserved.
//

import UIKit

class EpisodesTableViewController: UITableViewController
{
    var episodes = [Episode]()
    
    
    let searchController = UISearchController(searchResultsController: nil)
    var filteredNames = [Episode]()
    
    
    
    //        func filterContentForSearchText(searchText: String, scope: String = "All") {
    //            filteredNames = self.episodes.filter { name in
    //                return name.title!.lowercaseString.containsString(searchText.lowercaseString) || name.group!.lowercaseString.containsString(searchText.lowercaseString)
    //
    //            }
    //            tableView.reloadData()
    //        }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredNames = episodes.filter { name in
            
            return name.title!.lowercaseString.containsString(searchText.lowercaseString) || name.orderbymix!.lowercaseString.containsString(searchText.lowercaseString) || name.orderbygroup!.lowercaseString.containsString(searchText.lowercaseString)
            
        }
        
        tableView.reloadData()
    }
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        //            tableView.setContentOffset(CGPoint(x: 0, y: searchController.searchBar.frame.size.height), animated: false)
        //
        //            tableView.estimatedRowHeight = tableView.rowHeight
        //            tableView.rowHeight = UITableViewAutomaticDimension
        //            tableView.separatorStyle = .None
        
        
        self.episodes = Episode.downloadAllEpisodes()
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if searchController.active && searchController.searchBar.text != ""{
            return filteredNames.count
        }
        return episodes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Episode Cell", forIndexPath: indexPath) as! EpisodeTableViewCell
        //let episode = self.episodes[indexPath.row]
        
        let data: Episode
        
        if searchController.active && searchController.searchBar.text != "" {
            data = filteredNames[indexPath.row]
            
        }
        else {
            data = episodes[indexPath.row]
        }
        
        //let titleName = data.title!
        
        //cell.episode = episode
        cell.textLabel?.text = data.title
        cell.orderbymixLabel?.text = data.orderbymix
      
        
        
        return cell
    }
    
    //        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //            if segue.identifier == "SendData"{
    //                if let detailPage = segue.destinationViewController as? detailEpisodeViewController {
    //                    if let indexpath = tableView.indexPathForSelectedRow {
    //
    //                        let nameDetail : Episode
    //
    //                        if searchController.active && searchController.searchBar.text! != "" {
    //                            nameDetail = filteredNames[indexpath.row]
    //                        }
    //                        else {
    //                            nameDetail = episodes[indexpath.row]
    //                        }
    //
    //                        controller
    //                        let episode = episodes[indexpath.row]
    //                        detailPage.episode = episode
    //                    }
    //                }
    //        }
    //    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SendData" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let carDetail : Episode
                
                if searchController.active && searchController.searchBar.text! != "" {
                    carDetail = filteredNames[indexPath.row]
                }
                else {
                    carDetail = episodes[indexPath.row]
                }
                
                let controller = (segue.destinationViewController) as! detailEpisodeViewController
//                let EpisodesTableViewController: barcodeViewController = segue.destinationViewController as! barcodeViewController
                controller.episode = carDetail
                
            }
        }
    }
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    
}


extension EpisodesTableViewController: UISearchResultsUpdating {
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
