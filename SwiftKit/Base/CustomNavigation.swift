//
//  CustomNavigation.swift
//  SwiftKit
//
//  Created by Alex on 15/12/9.
//  Copyright © 2015年 Alex. All rights reserved.
//

import UIKit

class CustomNavigation: UINavigationController,UINavigationControllerDelegate,UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate = self
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if(interactivePopGestureRecognizer != nil && animated == true){
             self.interactivePopGestureRecognizer?.enabled = false
        }
        super.pushViewController(viewController, animated: true)
    }
    
    override func popToRootViewControllerAnimated(animated: Bool) -> [UIViewController]? {
        if(interactivePopGestureRecognizer != nil && animated == true){
            self.interactivePopGestureRecognizer?.enabled = false
        }
        return super.popToRootViewControllerAnimated(animated)
    }
    
    override func popToViewController(viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        if(interactivePopGestureRecognizer != nil){
            self.interactivePopGestureRecognizer?.enabled = false
        }
        return super.popToViewController(viewController, animated: animated)
    }
    
    func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
        if(interactivePopGestureRecognizer != nil){
            self.interactivePopGestureRecognizer?.enabled = true
        }
        
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailByGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if (gestureRecognizer == interactivePopGestureRecognizer){
            if(self.viewControllers.count < 2){
                return false
            }
        }
        return true
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
