//
//  TodoSchedulingViewController.swift
//  rxScan
//
//  Created by Yodfha on 8/1/2559 BE.
//  Copyright © 2559 Fhasai. All rights reserved.
//

import UIKit

class TodoSchedulingViewController: UIViewController {
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var deadlinePicker: UIDatePicker!
    
    var episode: Episode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = " "
        titleField.text = episode.title
//        if (titleField != "")
//        {
//           titleField.text = episode.title
//        }
      
        
        
        
        
//        if (titleLabel.text != "")
//        {
//            titleLabel.text = episode.title
//        }
    }

    
    @IBAction func savePressed(sender: UIButton) {
        let todoItem = TodoItem(deadline: deadlinePicker.date, title: titleField.text!, UUID: NSUUID().UUIDString)
        TodoList.sharedInstance.addItem(todoItem)
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
}