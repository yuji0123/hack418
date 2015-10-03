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
    
    
    // 位置情報取得
    var lm: CLLocationManager!
    var latitude: CLLocationDegrees! // 取得した緯度を保持するインスタンス
    var longitude: CLLocationDegrees! // 取得した経度を保持するインスタンス


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //friendSearchItem.append(<#T##newElement: Element##Element#>)

        
        // フィールドの初期化
        lm = CLLocationManager()
        longitude = CLLocationDegrees()
        latitude = CLLocationDegrees()
        
        // CLLocationManagerをDelegateに指定
        lm.delegate = self
        
        // 位置情報取得の許可を求めるメッセージの表示．必須．
        lm.requestAlwaysAuthorization()
        // 位置情報の精度を指定．任意，
        // lm.desiredAccuracy = kCLLocationAccuracyBest
        // 位置情報取得間隔を指定．指定した値（メートル）移動したら位置情報を更新する．任意．
        // lm.distanceFilter = 1000
        
        // GPSの使用を開始する
        lm.startUpdatingLocation()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /* 位置情報取得成功時に実行 */
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation){
        // 緯度の取得
        latitude = newLocation.coordinate.latitude
        // 経度の取得
        longitude = newLocation.coordinate.longitude

        NSLog("緯度: \(latitude) , 経度: \(longitude)")
        
        // GPSの使用を停止する．停止しない限りGPSは実行され，指定間隔で更新され続ける．
        // lm.stopUpdatingLocation()
    }
    
    /* 位置情報取得失敗時に実行 */
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        // この例ではLogにErrorと表示するだけ．
        NSLog("Error")
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
        
        let cell: FriendRankingTableViewCell = tableView.dequeueReusableCellWithIdentifier("RankingCell", forIndexPath: indexPath) as! FriendRankingTableViewCell
        let profileImageURL : String = friendRankingItems[indexPath.row].image_url as String
        let profileImage = UIImage(data: NSData(contentsOfURL: NSURL(string: profileImageURL)!)!)
        
        cell.rankingNumLabel.text = String(indexPath.row + 1)
        cell.friendImageView.image = profileImage
        cell.friendNameLabel.text = friendRankingItems[indexPath.row].name        
        return cell
    }
}

