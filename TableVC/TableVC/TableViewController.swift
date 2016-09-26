//
//  TableViewController.swift
//  Test
//
//  Created by 晨韦 on 16/9/22.
//  Copyright © 2016年 晨韦. All rights reserved.
//

import UIKit

struct User {
    var keynumber: Int
    var time: NSData
}

class TableViewController: UITableViewController {
    
    var userArr : Array<User> = [] //raw user data
    
    var sortedUser : [String : Array<User>] = ["Morning": [], "Afternoon": [], "Night": []]
    var sectionStatusArr : [String: Bool] = ["Morning": false, "Afternoon": false, "Night": false] // section status array used to control expanding

    override func viewDidLoad() {
        super.viewDidLoad()
        
       //randomly generate User
        for _ in 0...19 {
            let randomKey = Int( arc4random()%23)
            let user = User(keynumber: randomKey, time: NSData())
            
            userArr.append(user)
        }
        
        //classify user into corresponding group(time zone)
        //sort user: 8-12 -> morning, 13-18 -> afternoon, 19-8 -> night
        for user in userArr{
            switch user.keynumber {
            case 8,9,10,11,12:
                sortedUser["Morning"]?.append(user)
            case 13,14,15,16,17,18:
                sortedUser["Afternoon"]?.append(user)
            default:
                sortedUser["Night"]?.append(user)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sortedUser.keys.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        
        var rowcount = 0
        var shouldExpandSection = false
        switch section {
        case 0:
            rowcount = (sortedUser["Morning"]?.count)!
            shouldExpandSection = sectionStatusArr["Morning"]!
        case 1:
            rowcount = (sortedUser["Afternoon"]?.count)!
            shouldExpandSection = sectionStatusArr["Afternoon"]!
        default:
            rowcount = (sortedUser["Night"]?.count)!
            shouldExpandSection = sectionStatusArr["Night"]!
        }
        return shouldExpandSection ? rowcount : 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 60))
        
        let nameBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 375, height: 60))
        nameBtn.backgroundColor = UIColor.cyan
        nameBtn.tag = section
        nameBtn.addTarget(self, action: #selector(self.headerTouched(sender:)), for: .touchUpInside)
        
        switch section {
        case 0:
            nameBtn.setTitle("Morning", for: .normal)
        case 1:
            nameBtn.setTitle("Afternoon", for: .normal)
        default:
            nameBtn.setTitle("Night", for: .normal)
        }
        
        header.addSubview(nameBtn)
        
        return header
    }
    
    func headerTouched(sender:UIButton){
        switch sender.tag {
        case 0:
            sectionStatusArr["Morning"] = !sectionStatusArr["Morning"]!
        case 1:
            sectionStatusArr["Afternoon"] = !sectionStatusArr["Afternoon"]!
        default:
            sectionStatusArr["Night"] = !sectionStatusArr["Night"]!
        }
        self.tableView.reloadData()
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var sectionArr : Array<User>= []
        switch indexPath.section {
        case 0:
            sectionArr = sortedUser["Morning"]!
        case 1:
            sectionArr = sortedUser["Afternoon"]!
        default:
            sectionArr = sortedUser["Night"]!
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
    
        for subview in cell.subviews{
            subview.removeFromSuperview()
        }

        let lab = UILabel(frame: CGRect(x: 0, y: 0, width: 375, height: 40))
        lab.text = "Un:" + String(sectionArr[indexPath.row].keynumber)
        lab.textAlignment = .center
        cell.addSubview(lab)
        
        return cell
    }

}
