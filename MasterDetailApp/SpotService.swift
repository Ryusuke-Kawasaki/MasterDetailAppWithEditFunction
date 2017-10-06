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
    
    //SpotInfoListをplistに保存
    func saveSpotInfoList() {
        //ファイルの保存先を指定。今回はドキュメントディレクトリ配下のitems.plistファイルにデータを保存する
        var url = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask)[0]
        url.appendPathComponent("items.plist")

        //spotInfoListをファイルに保存する
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(spotInfoList)
            try data.write(to: url, options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding item array!")
        }
    }

    //SpotInfoListの読み込み
    func loadSpotInfoList() {
        //ファイルを読み込む場所を指定
        var url = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask)[0]
        url.appendPathComponent("items.plist")
        //ファイルから読み込んだ内容を
        if let data = try? Data(contentsOf: url) {
            let decoder = PropertyListDecoder()
            do {
                spotInfoList = try decoder.decode([SpotInfo].self, from: data)
            } catch {
                print("Error decoding item array!")
            }
        }
    }

    
    //spotInfoListの要素数を取得
    func countOfList()->Int{
        return self.spotInfoList.count
    }
    //spotInfoListに要素を追加
    func add(spotInfo:SpotInfo){
        self.spotInfoList.append(spotInfo)
    }
    //spotInfoListから指定したインデックスの要素を取得
    func objectInListAt(index:Int)->SpotInfo{
        return self.spotInfoList[index]
    }

    
    override init(){
        super.init()
        if self.spotInfoList.count == 0 {
            initializeDefaultDataList()
        }
    }
    
    func removeSpotInfo(index:Int){
        self.spotInfoList.remove(at: index)
    }
    
    func edit(spotInfo:SpotInfo,index:Int){
        self.spotInfoList[index] = spotInfo
    }
    
    private func initializeDefaultDataList(){
        var name = "渋谷ヒカリエ"
        var area = "渋谷区渋谷２−２１−１"
        var comment = "渋谷をアートな街へ導くランドマーク"
        var spotInfo = SpotInfo(name: name, area: area, comment: comment)
        add(spotInfo:spotInfo)

        name = "東京ソラマチ"
        area = "墨田区押上１−１−２"
        comment = "東京ソラマチで丸ごと１日遊んじゃおう"
        spotInfo = SpotInfo(name: name, area: area, comment: comment)
        add(spotInfo:spotInfo)
    }
    
}

