//
//  AlertView.swift
//  SwiftKit
//
//  Created by Alex on 15/12/9.
//  Copyright © 2015年 Alex. All rights reserved.
//

import UIKit

class AlertView: NSObject {
    
    /**
     显示Alert View
     - parameter alertType: 对话框类型
     */
    func showAlertView(alertType:Int) -> UIAlertController{
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
        return alertController
//        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func showAlert(message:String) -> UIAlertController{
        let alert = UIAlertController(title: "系统提示", message:message , preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "确定", style: .Default) { (action) -> Void in
            
        }
        alert.addAction(okAction)
        return alert
//        self.presentViewController(alert, animated: true, completion: nil)
    }


}
