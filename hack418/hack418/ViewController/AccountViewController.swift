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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //friendSearchItem.append(<#T##newElement: Element##Element#>)
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
        
        let cell: myMeetLogTableViewCell = tableView.dequeueReusableCellWithIdentifier("MyMeetLogCell", forIndexPath: indexPath) as! myMeetLogTableViewCell
        let profileImageURL : String = myMeetLogItems[indexPath.row].image_url as String
        let profileImage = UIImage(data: NSData(contentsOfURL: NSURL(string: profileImageURL)!)!)
        
        cell.friendImageView.image = profileImage
        cell.friendNameLabel.text = myMeetLogItems[indexPath.row].name
        cell.friendPositionLabel.text = String(myMeetLogItems[indexPath.row].position)
        
        return cell
    }
}

