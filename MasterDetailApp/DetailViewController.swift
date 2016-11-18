//
//  DetailViewController.swift
//  MasterDetailApp
//
//  Created by 川崎 隆介 on 2015/10/14.
//  Copyright (c) 2015年 川崎 隆介. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var spotNameLabel: UILabel!
    @IBOutlet weak var areaNameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!

    weak var delegate:SpotInfoEditDelegate?
    
    @IBAction func done(_ segue:UIStoryboardSegue){
        if segue.identifier == "DoneInput" {
            if let item = (segue.source as!
                SpotInfoEditTableViewController).detailItem {
                if let delegate = self.delegate {
                    delegate.spotInfoEditDid(item)
                }
                self.detailItem = item
                configureView()
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ segue:UIStoryboardSegue){
        self.dismiss(animated: true, completion: nil)
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
            if let label = self.spotNameLabel {
                label.text = detail.name
            }
            if let label = self.areaNameLabel {
                label.text = detail.area
            }
            if let label = self.commentLabel {
                label.text = detail.comment
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditInput" {
            //NavigationControllerの取得
            let navController = segue.destination as! UINavigationController
            //NavigationControllerから先頭のViewControllerを取得
            (navController.topViewController as! SpotInfoEditTableViewController).detailItem = self.detailItem
        }
    }
}
