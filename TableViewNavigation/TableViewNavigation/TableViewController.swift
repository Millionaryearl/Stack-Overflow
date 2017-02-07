//
//  TableViewController.swift
//  TableViewNavigation
//
//  Created by 晨韦 on 17/2/7.
//  Copyright © 2017年 晨韦. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var articleDataArr = ["Article1","Article2"]
    var readingDataArr = ["Reading1","Reading2"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return section == 0 ? articleDataArr.count : readingDataArr.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 44 : 151
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var finalCell = UITableViewCell()
        
        if indexPath.section == 0 {
            //article section
            let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleCell
            cell.nameLab.text = articleDataArr[indexPath.row]
            finalCell = cell
        }else{
            //reading section
            let cell = tableView.dequeueReusableCell(withIdentifier: "readingCell", for: indexPath) as! ReadingCell
            cell.nameLab.text = readingDataArr[indexPath.row]
            cell.coverImg.image = UIImage(named: "ReadingCover")
            finalCell = cell
        }
        return finalCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //distinguish cell by indexpath
//        switch indexPath.section {
//        case 0:
//            //article cell clicked
//            let articlevc = self.storyboard?.instantiateViewController(withIdentifier: "Articles") as! ArticlesVC
//            //pass some params
//            articlevc.someParams = articleDataArr[indexPath.row]
//            self.present(articlevc, animated: true, completion: nil)
//            break
//        case 1:
//            //reading cell clicked
//            let readingvc = self.storyboard?.instantiateViewController(withIdentifier: "Reading") as! ReadingVC
//            //pass some params
//            readingvc.someParams = readingDataArr[indexPath.row]
//            self.present(readingvc, animated: true, completion: nil)
//        default:
//            break
//        }
        
        //or u can distinguish cell by its class
        let touchedCell = tableView.cellForRow(at: indexPath)
        if touchedCell is ArticleCell{
            //article cell clicked
            let articlevc = self.storyboard?.instantiateViewController(withIdentifier: "Articles") as! ArticlesVC
            //pass some params
            articlevc.someParams = articleDataArr[indexPath.row]
            self.present(articlevc, animated: true, completion: nil)
        }else if touchedCell is ReadingCell{
            //reading cell clicked
            let readingvc = self.storyboard?.instantiateViewController(withIdentifier: "Reading") as! ReadingVC
            //pass some params
            readingvc.someParams = readingDataArr[indexPath.row]
            self.present(readingvc, animated: true, completion: nil)
        }
    }
}
