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
        
        
        // 架空データの作成
        let f1 = MyMeetLogItem(name: "Yuji Kouketsu", image_url: "https://scontent-nrt1-1.xx.fbcdn.net/hphotos-xft1/v/t1.0-9/10407835_1568751020039193_8681893949726244498_n.jpg?oh=237e401c4ea1c9df5f8408d2273e8913&oe=569A4877", position: "200m以内")
        let f2 = MyMeetLogItem(name: "Yusuke Morishita", image_url: "https://scontent-nrt1-1.xx.fbcdn.net/hphotos-xap1/v/t1.0-9/1526578_200575616812340_486668951_n.jpg?oh=fda9c921be090bb291f972120dcb0f2e&oe=569C3292", position: "500m以内")
        
        myMeetLogItems.append(f1)
        myMeetLogItems.append(f2)
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
        let profileImageURL : String = myMeetLogItems[indexPath.row].image_url as String
        let profileImage = UIImage(data: NSData(contentsOfURL: NSURL(string: profileImageURL)!)!)
        let friendname = myMeetLogItems[indexPath.row].name
        let friendposition = String(myMeetLogItems[indexPath.row].position!)
        
        cell.friendImageView.image = profileImage
        cell.friendNameLabel.text = friendname
        cell.friendPositionLabel.text = String(friendposition)
        
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

