//
//  SpotInfo.swift
//  MasterDetailApp
//
//  Created by 川崎 隆介 on 2015/10/14.
//  Copyright (c) 2015年 川崎 隆介. All rights reserved.
//

import UIKit

struct SpotInfo : Codable{
    var name = ""
    var area = ""
    var comment = ""
    var checkmark = false
    
    init(name:String , area:String , comment:String) {
        self.init(name: name, area: area, comment: comment, checkmark: false)
    }
    
    init(name:String , area:String , comment:String , checkmark:Bool) {
        self.name = name
        self.area = area
        self.comment = comment
        self.checkmark = checkmark
    }
}


