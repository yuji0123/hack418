//
//  SecondViewController.swift
//  hack418
//
//  Created by anthony on 2015/10/03.
//  Copyright © 2015年 teamB. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AccountViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    var myMeetLogItems = [MyMeetLogItem]()
    @IBOutlet weak var tableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //getJSON()
        
        tableview.delegate = self
        tableview.dataSource = self
        
        self.tableview.rowHeight = 80

        
        
        // 架空データの作成
        let f1 = MyMeetLogItem(name: "Yuji Kouketsu", image_url: "koketsu.jpg", position: "2015/10/4 16:21")
        let f2 = MyMeetLogItem(name: "Yusuke Morishita", image_url: "yusuke.jpg", position: "2015/10/4 16:21")
        let f3 = MyMeetLogItem(name: "Yusuke Morishita", image_url: "yusuke.jpg", position: "2015/10/3 18:11")
        let f4 = MyMeetLogItem(name: "Yuji Kouketsu", image_url: "koketsu.jpg", position: "2015/10/3 10:32")
        let f5 = MyMeetLogItem(name: "Yuji Kouketsu", image_url: "koketsu.jpg", position: "2015/10/2 18:20")
        let f6 = MyMeetLogItem(name: "Yuji Kouketsu", image_url: "koketsu.jpg", position: "2015/10/1 19:32")
        
        myMeetLogItems.append(f1)
        myMeetLogItems.append(f2)
        myMeetLogItems.append(f3)
        myMeetLogItems.append(f4)
        myMeetLogItems.append(f5)
        myMeetLogItems.append(f6)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // for table view
    
    // セクション数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // セクションの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myMeetLogItems.count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        
        let cell: myMeetLogTableViewCell = tableview.dequeueReusableCellWithIdentifier("MyLogCell", forIndexPath: indexPath) as! myMeetLogTableViewCell
        
        cell.friendImageView.image = UIImage(named: myMeetLogItems[indexPath.row].image_url)
        cell.friendNameLabel.text = myMeetLogItems[indexPath.row].name
        cell.friendPositionLabel.text = myMeetLogItems[indexPath.row].position
        
        return cell
    }
    
    func getJSON () {
        //Getリクエスト
        Alamofire.request(.GET, "https://hack418b.herokuapp.com/users/1.json", parameters: nil)
            .responseJSON { resource in
                //let json = SwiftyJSON.JSON(resource.)
                //print(resource)
                //myMeetLogItems.append(json)
        }
        
    }
}

