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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //friendSearchItem.append(<#T##newElement: Element##Element#>)
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
        
        let cell: FriendSearchTableViewCell = tableView.dequeueReusableCellWithIdentifier("SearchFriendCell", forIndexPath: indexPath) as! FriendSearchTableViewCell
        let profileImageURL : String = friendSearchItem[indexPath.row].image_url as String
        let profileImage = UIImage(data: NSData(contentsOfURL: NSURL(string: profileImageURL)!)!)
        
        cell.friendImageView.image = profileImage
        cell.friendNameLabel.text = friendSearchItem[indexPath.row].name
        cell.friendPositionLabel.text = String(friendSearchItem[indexPath.row].position)
        
        return cell
    }
}
