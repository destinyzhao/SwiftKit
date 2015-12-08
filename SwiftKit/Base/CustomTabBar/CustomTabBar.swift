//
//  CustomTabBar.swift
//  SwiftKit
//
//  Created by Alex on 15/12/8.
//  Copyright © 2015年 Alex. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        /*
        let homeStoryBoard:UIStoryboard! = UIStoryboard(name: "Home", bundle: nil)
        let classStoryBoard:UIStoryboard! = UIStoryboard(name: "Class", bundle: nil)
        let brandStoryBoard:UIStoryboard! = UIStoryboard(name: "Brand", bundle: nil)
        let shopingStoryBoard:UIStoryboard! = UIStoryboard(name: "Shoping", bundle: nil)
        let personalStoryBoard:UIStoryboard! = UIStoryboard(name: "Personal", bundle: nil)
        
        let homeNavi = homeStoryBoard.instantiateInitialViewController() as! UINavigationController
        let classNavi = classStoryBoard.instantiateInitialViewController() as! UINavigationController
        let brandNavi = brandStoryBoard.instantiateInitialViewController() as! UINavigationController
        let shopingNavi = shopingStoryBoard.instantiateInitialViewController() as! UINavigationController
        let personalNavi = personalStoryBoard.instantiateInitialViewController() as! UINavigationController
        
        homeNavi.tabBarItem =  UITabBarItem(title: "首页", image: UIImage(named: "tabbar_home_n"), selectedImage: UIImage(named: "tabbar_home_s"))
        classNavi.tabBarItem = UITabBarItem(title: "分类", image: UIImage(named: "tabbar_saunter_n"), selectedImage: UIImage(named: "tabbar_saunter_s"))
        brandNavi.tabBarItem = UITabBarItem(title: "品牌团", image: UIImage(named: "tabbar_branc_n"), selectedImage: UIImage(named: "tabbar_branc_s"))
        shopingNavi.tabBarItem = UITabBarItem(title: "积分商城", image: UIImage(named: "tabbar_point_n"), selectedImage: UIImage(named: "tabbar_point_s"))
        personalNavi.tabBarItem = UITabBarItem(title: "个人中心", image: UIImage(named: "tabbar_personal_n"), selectedImage: UIImage(named: "tabbar_personal_s"))
        
        self.viewControllers = [homeNavi, classNavi,brandNavi,shopingNavi,personalNavi]
        */

        addChildViewController("Home", title: "首页", imageName: "tabbar_home_n", selectImageName: "tabbar_home_s")
        addChildViewController("Class", title: "分类", imageName: "tabbar_saunter_n", selectImageName: "tabbar_saunter_s")
        addChildViewController("Brand", title: "品牌团", imageName: "tabbar_branc_n", selectImageName: "tabbar_branc_s")
        addChildViewController("Shoping", title: "积分商城", imageName: "tabbar_point_n", selectImageName: "tabbar_point_s")
        addChildViewController("Personal", title: "个人中心", imageName: "tabbar_personal_n", selectImageName: "tabbar_personal_s")
        
        self.tabBar.tintColor = UIColor.redColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   private func addChildViewController(sbName:String,title:String,imageName:String,selectImageName:String) {
        let storyBoard = UIStoryboard(name: sbName, bundle: nil)
        let navi = storyBoard.instantiateInitialViewController() as! UINavigationController
        navi.topViewController?.title = title
        navi.tabBarItem.title = title
        navi.tabBarItem.image = UIImage(named: imageName)
        navi.tabBarItem.selectedImage = UIImage(named: selectImageName)
        
        addChildViewController(navi)
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
