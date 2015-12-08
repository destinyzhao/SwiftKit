//
//  HomeViewController.swift
//  SwiftKit
//
//  Created by Alex on 15/12/8.
//  Copyright © 2015年 Alex. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var dataArray = []
    let cellIndetifier = "myCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        dataArray = ["AlertViewDemo","ActionSheetDemo"]
        
        print("HomeViewController viewDidLoad")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: cellIndetifier)
        cell.textLabel!.text = self.dataArray[indexPath.row] as? String
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.row == 0){
            showAlertView(0)
        }
        else if(indexPath.row == 1){
            showAlertView(1)
        }
    }
    
    /**
     显示Alert View
     - parameter alertType: 对话框类型
     */
    func showAlertView(alertType:Int){
        let alertController:UIAlertController
        if alertType == 0{
            alertController = UIAlertController(title: "系统提示", message: "你确定要退出？", preferredStyle:.Alert)
        }
        else{
            alertController = UIAlertController(title: "系统提示", message: "你确定要退出？", preferredStyle:.ActionSheet)
        }
        
        let okAction = UIAlertAction(title: "确定", style: .Default) { (action) -> Void in
            print("用户点击了确定")
        }
        let cancelAction = UIAlertAction(title: "取消", style: .Default) { (action) -> Void in
            print("用户点击了取消")
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
