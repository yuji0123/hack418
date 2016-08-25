//
//  TopViewController.swift
//  hack418
//
//  Created by anthony on 2015/10/04.
//  Copyright © 2015年 teamB. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class TopViewController: UITabBarController {
    
    // 位置情報取得
    var lm: CLLocationManager!
    var latitude: CLLocationDegrees! // 取得した緯度を保持するインスタンス
    var longitude: CLLocationDegrees! // 取得した経度を保持するインスタンス
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // タブバーの色変更
        let colorBg = UIColor(red: 73/255, green: 198/255, blue: 255/255, alpha: 1.0)
        UITabBar.appearance().barTintColor = colorBg
        
        
        //getJSON()
    }
    
    func getJSON () {
        //Getリクエスト
        Alamofire.request(.GET, "https://hack418b.herokuapp.com/users/1.json", parameters: nil)
            .responseJSON { resource in
                print(resource)
        }
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
}
