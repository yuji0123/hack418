//
//  FirstViewController.swift
//  hack418
//
//  Created by anthony on 2015/10/03.
//  Copyright © 2015年 teamB. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class RankingViewController: UIViewController, CLLocationManagerDelegate, UITableViewDataSource, UITableViewDelegate  {
    
    var friendRankingItems = [FriendRankingItem]()
    
    @IBOutlet weak var tableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //self.tableView.registerClass(FriendRankingItem, forHeaderFooterViewReuseIdentifier: "RankCell")
        
        // 架空データの作成
        let f1 = FriendRankingItem(name: "Yuji Kouketsu", image_url: "https://scontent-nrt1-1.xx.fbcdn.net/hphotos-xft1/v/t1.0-9/10407835_1568751020039193_8681893949726244498_n.jpg?oh=237e401c4ea1c9df5f8408d2273e8913&oe=569A4877", point: 12)
        let f2 = FriendRankingItem(name: "Yusuke Morishita", image_url: "https://scontent-nrt1-1.xx.fbcdn.net/hphotos-xap1/v/t1.0-9/1526578_200575616812340_486668951_n.jpg?oh=fda9c921be090bb291f972120dcb0f2e&oe=569C3292", point: 4)
        
        friendRankingItems.append(f1)
        friendRankingItems.append(f2)
        
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
        return friendRankingItems.count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        
        let cell: FriendRankingTableViewCell = tableView.dequeueReusableCellWithIdentifier("RankCell", forIndexPath: indexPath) as! FriendRankingTableViewCell
        let profileImageURL : String = friendRankingItems[indexPath.row].image_url as String
        
        cell.rankingNumLabel.text = "\(indexPath.row+1)."
        cell.rankingNumLabel.text = friendRankingItems[indexPath.row].name
        cell.friendImageView.image = UIImage(data: NSData(contentsOfURL: NSURL(string: profileImageURL)!)!)
        cell.friendNameLabel.text = "\(friendRankingItems[indexPath.row].point)Pt"
        return cell
    }
    
//    func getJSON () {
//        //Getリクエスト
////        Alamofire.request(.GET, "https://hack418b.herokuapp.com/users.json", parameters: nil)
////            .responseJSON { resource in
////                //friendRankingItems.append(resource)
////                print(resource)
////        }
//        
//        var request: NSURLRequest?
//        var response: NSHTTPURLResponse?
//        var result: Result<AnyObject>!
//        
//        Alamofire.request(.GET, "https://hack418b.herokuapp.com/users.json", parameters: nil)
//            .responseJSON { responseRequest, responseResponse, responseResult in
//                request = responseRequest
//                response = responseResponse
//                result = responseResult
//                
//                print(result.value)
//                print(result.data)
//                
//                
//               // expectation.fulfill()
//        }
//        
//    }
}

