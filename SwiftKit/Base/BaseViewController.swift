//
//  BaseViewController.swift
//  SwiftKit
//
//  Created by Alex on 15/12/9.
//  Copyright © 2015年 Alex. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 自定义导航返回按钮
        if(self.navigationItem.leftBarButtonItem == nil){
            let leftItem = UIBarButtonItem(image: UIImage(named: "backBtn"), style: UIBarButtonItemStyle.Plain, target: self, action: "goBack:")
            leftItem.tintColor = UIColor.blueColor()
            self.navigationItem.leftBarButtonItem = leftItem
        }
    }
    
    func goBack(sender:AnyObject){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
