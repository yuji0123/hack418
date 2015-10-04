//
//  FriendSearchViewController.swift
//  hack418
//
//  Created by anthony on 2015/10/03.
//  Copyright © 2015年 teamB. All rights reserved.
//

import UIKit

class FriendSearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var friendSearchItem = [FriendSearchItem]()
    @IBOutlet weak var tableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //friendSearchItem.append(newElement: Element)
        
        self.tableview.dataSource = self
        self.tableview.delegate = self
        
        self.tableview.rowHeight = 80

        
        // 架空データの作成
        let f1 = FriendSearchItem(name: "Yuji Kouketsu", image_url: "koketsu.jpg", position: "100m以内")
        let f2 = FriendSearchItem(name: "Yusuke Morishita", image_url: "yusuke.jpg", position: "150m以内")
        
        friendSearchItem.append(f1)
        friendSearchItem.append(f2)
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
        
        let cell: FriendSearchTableViewCell = tableview.dequeueReusableCellWithIdentifier("SearchFriendCell", forIndexPath: indexPath) as! FriendSearchTableViewCell
        
        cell.friendImageView.image = UIImage(named: friendSearchItem[indexPath.row].image_url)
        cell.friendNameLabel.text = friendSearchItem[indexPath.row].name
        cell.friendPositionLabel.text = String(friendSearchItem[indexPath.row].position)
        
        return cell
    }
    
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        let cell: FriendSearchTableViewCell = tableview.dequeueReusableCellWithIdentifier("SearchFriendCell", forIndexPath: indexPath) as! FriendSearchTableViewCell
       
        friendSearchItem.removeFirst()
        self.tableview.reloadData()
        
    }
    
//    func getJSON () {
//        //Getリクエスト
//        Alamofire.request(.POST, "https://hack418b.herokuapp.com/pickelpost.json", parameters: nil)
//            .responseJSON { resource in
//                print(resource)
//                //let json = SwiftyJSON.JSON(resource!)
//                //jsonItems.append(json)
//
//        }
//    }
}
