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
        self.tableView.rowHeight = 80
        
        //self.tableView.registerClass(FriendRankingItem, forHeaderFooterViewReuseIdentifier: "RankCell")
        
        // 架空データの作成
        let f1 = FriendRankingItem(name: "Yuji Kouketsu", image_url: "koketsu.jpg", point: 12)
        let f2 = FriendRankingItem(name: "Yusuke Morishita", image_url: "yusuke.jpg", point: 4)
        
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
        cell.rankingNumLabel.text = "\(indexPath.row+1)."
        cell.friendNameLabel.text = friendRankingItems[indexPath.row].name
        cell.friendImageView.image = UIImage(named: friendRankingItems[indexPath.row].image_url)
        cell.friendMeetInfoLabel.text = "\(friendRankingItems[indexPath.row].point)Pt"
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

