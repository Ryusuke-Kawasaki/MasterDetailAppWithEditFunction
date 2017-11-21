//
//  MasterViewController.swift
//  MasterDetailApp
//
//  Created by 川崎 隆介 on 2015/10/14.
//  Copyright (c) 2015年 川崎 隆介. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController,SpotInfoEditDelegate {

    var spotService = SpotService()
    
    func spotInfoEditDid(_ spotInfo: SpotInfo) {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            self.spotService.edit(spotInfo:spotInfo, index: indexPath.row)
            
            self.spotService.saveSpotInfoList()
            
            self.tableView.reloadData()
        }
    }
    
    @IBAction func done(_ segue:UIStoryboardSegue){
        if segue.identifier == "DoneInput"{
            let addController = segue.source as! SpotInfoAddtionalTableViewController
            if let spotInfo = addController.spotInfo {
                self.spotService.add(spotInfo:spotInfo)
                
                self.spotService.saveSpotInfoList()
                
                self.tableView.reloadData()
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ segue:UIStoryboardSegue){
        self.dismiss(animated: true, completion: nil)        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        self.spotService.loadSpotInfoList()
        for info in self.spotService.spotInfoList {
            print(info.name)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    func insertNewObject(sender: AnyObject) {
        objects.insert(NSDate(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    */
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                let spotInfo = self.spotService.objectInListAt(index: indexPath.row)
                (segue.destination as! DetailViewController).detailItem = spotInfo
                (segue.destination as! DetailViewController).delegate = self
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return objects.count
        return self.spotService.countOfList()
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "観光地";
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Cellの識別子を指定してCellを取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpotCell", for: indexPath)
        //Cellに表示したいデータを設定
        let spotInfo = self.spotService.objectInListAt(index:indexPath.row)
        cell.textLabel?.text = spotInfo.name
        cell.detailTextLabel?.text = spotInfo.comment
        
        //ここを追記
        //アイコンを表示すべきかどうかを判定
        if spotInfo.checkmark {
            cell.imageView?.image = UIImage(named: "trip")
        }else {
            cell.imageView?.image = nil
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.spotService.removeSpotInfo(index:indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //以下の処理を行う
        //1.選択された行に対応するSpotInfoを取り出す
        //2.アイコンを表示・非表示の設定を更新
        //3.現在の状態をファイルに保存する
        var spotInfo = self.spotService.objectInListAt(index:indexPath.row)
        spotInfo.checkmark = !(spotInfo.checkmark)
        self.spotService.edit(spotInfo:spotInfo, index: indexPath.row)
        self.spotService.saveSpotInfoList()

        //選択されたセルを取得
        if let cell =  tableView.cellForRow(at: indexPath) {
            //1.アイコンを表示すべきかどうかを判定
            if spotInfo.checkmark {
                //表示するならアイコンを設定
                cell.imageView?.image = UIImage(named: "trip")
            }else {
                //表示しないならnilを設定
                cell.imageView?.image = nil
            }
        }
        //セル選択解除時のアニメーションを設定
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}



