//
//  FriendRankingItem.swift
//  hack418
//
//  Created by anthony on 2015/10/03.
//  Copyright © 2015年 teamB. All rights reserved.
//

import Foundation

struct FriendRankingItem {
    var name: String!
    var image_url: String!
    var point: Int!
    
    init(name: String, image_url: String, point: Int) {
        self.name = name
        self.image_url = image_url
        self.point = point
    }
}