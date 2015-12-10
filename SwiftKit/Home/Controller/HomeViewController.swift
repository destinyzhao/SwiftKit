//
//  HomeViewController.swift
//  SwiftKit
//
//  Created by Alex on 15/12/8.
//  Copyright © 2015年 Alex. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,HomeDetialDelegate {

    @IBOutlet weak var tableView: UITableView!
    var dataArray = []
    let cellIndetifier = "myCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        dataArray = ["AlertViewDemo","ActionSheetDemo","页面传值-Delegate","页面传值-Closure","自定义导航返回按钮"]
        
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
        else if(indexPath.row == 2){
            // 代码跳转
            let viewController:HomeDetailViewController = UIStoryboard(name: "Home", bundle: nil)
                .instantiateViewControllerWithIdentifier("HomeDetailVC") as! HomeDetailViewController
            viewController.delegate = self
            viewController.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        else if (indexPath.row == 3){
            // Segue跳转
            self.performSegueWithIdentifier("DetailVC", sender: nil)
        }
        else if (indexPath.row == 4){
            self.performSegueWithIdentifier("customNavBackBtnVC", sender: nil)
        }

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // 影藏TabBar
        segue.destinationViewController.hidesBottomBarWhenPushed = true
        
        if segue.identifier == "DetailVC"{
            let homeDetialVC = segue.destinationViewController as! HomeDetailViewController
            homeDetialVC.Index = 2
            // 闭包回传值
            homeDetialVC.initWithClosure{ message in
               self.showAlert(message)
            }
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
    

    func showAlert(message:String){
        let alert = UIAlertController(title: "系统提示", message:message , preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "确定", style: .Default) { (action) -> Void in
            
        }
        alert.addAction(okAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    /**
     委托传值
     
     - parameter value:
     */
    func passVauleFromHomeDetailVC(value: String) {
       showAlert(value)
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
