//
//  memoViewController.swift
//  rxScan
//
//  Created by Yodfha on 7/31/2559 BE.
//  Copyright © 2559 Fhasai. All rights reserved.
//

import UIKit
import CoreData

class memoViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var allMemo = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        title = "Memo List"
        tableView.registerClass(UITableViewCell.self,
        forCellReuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "Memo")
        
        //3
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest)
            allMemo = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
 
    func tableView(tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return allMemo.count
    }
    
    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell =
            tableView.dequeueReusableCellWithIdentifier("Cell")
        
        let memo = allMemo[indexPath.row]
        
        cell!.textLabel!.text =
            memo.valueForKey("list") as? String
        
        return cell!
    }
    
    
    
    @IBAction func addList(sender: AnyObject) {
        
        let alert = UIAlertController(title: "New List",
          message: "Add a new list",
          preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save",
          style: .Default,
          handler: { (action:UIAlertAction) -> Void in
                                        
        let textField = alert.textFields!.first
        self.saveList(textField!.text!)
        self.tableView.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel",
          style: .Default) { (action: UIAlertAction) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert,
            animated: true,
            completion: nil)
    }
    
    func saveList(list: String) {
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entityForName("Memo",
            inManagedObjectContext:managedContext)
        
        let memo = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext: managedContext)
        
        //3
        memo.setValue(list, forKey: "list")
        
        //4
        do {
            try managedContext.save()
            //5
            allMemo.append(memo)
        } catch let error as NSError  {
          print("Could not save \(error), \(error.userInfo)")
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
   
     func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        switch editingStyle {
        case .Delete:
            
            let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let context:NSManagedObjectContext = appDel.managedObjectContext
            context.deleteObject(allMemo[indexPath.row] as NSManagedObject)
            allMemo.removeAtIndex(indexPath.row)
            do {
                try context.save()
            } catch _ {
            }
            
            //tableView.reloadData()
            
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        default:
            return
            
        }
    }
    
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
  

}
