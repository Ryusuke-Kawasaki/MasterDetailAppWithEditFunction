//
//  SpotInfo.swift
//  MasterDetailApp
//
//  Created by 川崎 隆介 on 2015/10/14.
//  Copyright (c) 2015年 川崎 隆介. All rights reserved.
//

import UIKit

class SpotInfo : NSObject{
    var name = ""
    var area = ""
    var comment = ""
    
    init(name:String,area:String,comment:String){
        super.init()
        self.name = name
        self.area = area
        self.comment = comment
    }
}

