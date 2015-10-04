//
//  FriendSearchItem.swift
//  hack418
//
//  Created by anthony on 2015/10/03.
//  Copyright © 2015年 teamB. All rights reserved.
//

import Foundation


struct FriendSearchItem {
    var name: String!
    var image_url: String!
    var position: Float!
    
    init(name: String, image_url: String, position: Float) {
        self.name = name
        self.image_url = image_url
        self.position = position
        
    }
}