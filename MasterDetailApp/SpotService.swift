//
//  SpotService.swift
//  MasterDetailApp
//
//  Created by 川崎 隆介 on 2015/10/14.
//  Copyright (c) 2015年 川崎 隆介. All rights reserved.
//

import UIKit

class SpotService : NSObject{
    //SpotInfoを格納する配列プロパティ
    var spotInfoList:[SpotInfo] = []
    
    //spotInfoListの要素数を取得
    func countOfList()->Int{
        return self.spotInfoList.count
    }
    //spotInfoListに要素を追加
    func addSpotInfo(_ spotInfo:SpotInfo){
        self.spotInfoList.append(spotInfo)
    }
    //spotInfoListから指定したインデックスの要素を取得
    func objectInListAtIndex(_ index:Int)->SpotInfo{
        return self.spotInfoList[index]
    }

    
    override init(){
        super.init()
        initializeDefaultDataList()
    }
    
    func removeSpotInfo(_ index:Int){
        self.spotInfoList.remove(at: index)
    }
    
    func editSpotInfo(_ spotInfo:SpotInfo,index:Int){
        self.spotInfoList[index] = spotInfo
    }
    
    private func initializeDefaultDataList(){
        var name = "渋谷ヒカリエ"
        var area = "渋谷区渋谷２−２１−１"
        var comment = "渋谷をアートな街へ導くランドマーク"
        var spotInfo = SpotInfo(name: name, area: area, comment: comment)
        addSpotInfo(spotInfo)

        name = "東京ソラマチ"
        area = "墨田区押上１−１−２"
        comment = "東京ソラマチで丸ごと１日遊んじゃおう"
        spotInfo = SpotInfo(name: name, area: area, comment: comment)
        addSpotInfo(spotInfo)
    }
    
}

