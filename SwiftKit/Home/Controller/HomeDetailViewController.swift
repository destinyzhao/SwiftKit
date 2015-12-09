//
//  HomeDetailViewController.swift
//  SwiftKit
//
//  Created by Alex on 15/12/8.
//  Copyright © 2015年 Alex. All rights reserved.
//

import UIKit

protocol HomeDetialDelegate{
    func passVauleFromHomeDetailVC(value:String)
}

typealias myClosure = (String) -> Void

class HomeDetailViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var Index:Int = 0
    
    var delegate:HomeDetialDelegate!
    var passVauleClosure:myClosure?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.textField.text = "\(Index)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initWithClosure(closure:myClosure){
        passVauleClosure = closure
    }
    
    @IBAction func BtnClicked(sender: AnyObject) {
      
        if(delegate != nil && self.textField.text != nil)
        {
            self.navigationController?.popViewControllerAnimated(true)
            self.delegate?.passVauleFromHomeDetailVC(self.textField.text!)
        }
        
    }
    
    @IBAction func ClosureBtnClicked(sender: AnyObject) {
        
        if(passVauleClosure != nil && self.textField.text != nil){
            self.navigationController?.popViewControllerAnimated(true)
            passVauleClosure!(self.textField.text!)
        }
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
