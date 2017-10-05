//
//  SpotInfoEditTableViewController.swift
//  MasterDetailApp
//
//  Created by 川崎 隆介 on 2015/11/24.
//  Copyright (c) 2015年 川崎 隆介. All rights reserved.
//

import UIKit

class SpotInfoEditTableViewController: UITableViewController,UITextFieldDelegate {

    @IBOutlet weak var spotNameField: UITextField!
    @IBOutlet weak var areaField: UITextField!
    @IBOutlet weak var commentField: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    var detailItem: SpotInfo? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail: SpotInfo = self.detailItem {
            if let field = self.spotNameField {
                field.text = detail.name
            }
            if let field = self.areaField {
                field.text = detail.area
            }
            if let field = self.commentField {
                field.text = detail.comment
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  let name = self.spotNameField.text,
            let area = self.areaField.text,
            let comment = self.commentField.text {
            if name.count > 0 || area.count > 0 || comment.count > 0 {
                self.detailItem = SpotInfo(name: name, area: area, comment: comment)
            }
        }
    }
    

}
