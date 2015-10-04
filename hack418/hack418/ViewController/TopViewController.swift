//
//  TopViewController.swift
//  hack418
//
//  Created by anthony on 2015/10/04.
//  Copyright © 2015年 teamB. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TopViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // タブバーの色変更
        let colorBg = UIColor(red: 73/255, green: 198/255, blue: 255/255, alpha: 1.0)
        UITabBar.appearance().barTintColor = colorBg
        
        // apiまわり
        let params =
        ["id": [1, 2]]
        
        //Getリクエスト
        Alamofire.request(.GET, "https://hack418b.herokuapp.com/users", parameters: params, encoding: .JSON)
            .response { (request, response, data, error) in
                // レスポンスハンドリング
                let json = SwiftyJSON.JSON(data!)
                print(json)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
