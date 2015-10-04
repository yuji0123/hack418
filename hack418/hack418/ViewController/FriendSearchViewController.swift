//
//  FriendSearchViewController.swift
//  hack418
//
//  Created by anthony on 2015/10/03.
//  Copyright © 2015年 teamB. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FriendSearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var friendSearchItem = [FriendSearchItem]()
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //friendSearchItem.append(newElement: Element)
        
        // 架空データの作成
        let f1 = MyMeetLogItem(name: "Yuji Kouketsu", image_url: "https://scontent-nrt1-1.xx.fbcdn.net/hphotos-xft1/v/t1.0-9/10407835_1568751020039193_8681893949726244498_n.jpg?oh=237e401c4ea1c9df5f8408d2273e8913&oe=569A4877", position: "200m以内")
        let f2 = MyMeetLogItem(name: "Yusuke Morishita", image_url: "https://scontent-nrt1-1.xx.fbcdn.net/hphotos-xft1/v/t1.0-9/10407835_1568751020039193_8681893949726244498_n.jpg?oh=237e401c4ea1c9df5f8408d2273e8913&oe=569A4877", position: "500m以内")
        
        //friendSearchItem.append(f1)
        //friendSearchItem.append(f2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // functions needed to be implemented
    // for table view
    
    // セクション数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // セクションの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendSearchItem.count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        
        let cell: FriendSearchTableViewCell = tableView.dequeueReusableCellWithIdentifier("SearchCell", forIndexPath: indexPath) as! FriendSearchTableViewCell
        let profileImageURL : String = friendSearchItem[indexPath.row].image_url as String
        let profileImage = UIImage(data: NSData(contentsOfURL: NSURL(string: profileImageURL)!)!)
        
        cell.friendImageView.image = profileImage
        cell.friendNameLabel.text = friendSearchItem[indexPath.row].name
        cell.friendPositionLabel.text = String(friendSearchItem[indexPath.row].position)
        
        return cell
    }
    
    func getJSON () {
        //Getリクエスト
        Alamofire.request(.POST, "https://hack418b.herokuapp.com/pickelpost.json", parameters: nil)
            .responseJSON { resource in
                print(resource)
                //let json = SwiftyJSON.JSON(resource!)
                //jsonItems.append(json)

        }
    }
}
