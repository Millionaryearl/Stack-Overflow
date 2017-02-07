//
//  ArticlesVC.swift
//  TableViewNavigation
//
//  Created by 晨韦 on 17/2/7.
//  Copyright © 2017年 晨韦. All rights reserved.
//

import UIKit

class ArticlesVC: UIViewController {
    
    var someParams : String! = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        print("-----------------------")
        print("someParams:\(someParams)")
        print("-----------------------")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backFunc(){
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
