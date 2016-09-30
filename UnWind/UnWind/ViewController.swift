//
//  ViewController.swift
//  UnWind
//
//  Created by 晨韦 on 16/9/30.
//  Copyright © 2016年 晨韦. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goSec(){
        self.performSegue(withIdentifier: "GoSec", sender: self)
    }
    
    @IBAction func performUnwindSegue(segue: UIStoryboardSegue) {
        if segue.identifier == "BackFromSecVC" {
            print("back from sec vc")
            
            //pass parameters here
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "GoSec" {
            print("going to second VC")
            
            //pass parameters here
        }
    }

}

