//
//  DataModel.swift
//  WeatherService
//
//  Created by 天野修一 on 2020/11/29.
//

import Foundation

struct CityModel {
//APIで取ってくるエリア情報の型を設定する
    
    //地域の名前とURLを追加するプロパティを持つ
        let code: String
        let name: String

        init(cityCode:String, cityName:String) {
            code = cityCode
            name = cityName
        }
    
}

struct CityList {
    
    var list = [CityModel]()

    //Webサイトを見て適当に地域を追加
    init() {
        list.append(CityModel(cityCode: "sapporo", cityName: "札幌"))
        list.append(CityModel(cityCode: "muroran", cityName: "室蘭"))
        list.append(CityModel(cityCode: "sendai", cityName: "仙台"))
        list.append(CityModel(cityCode: "saitama", cityName: "さいたま"))
        list.append(CityModel(cityCode: "tokyo", cityName: "東京"))
        list.append(CityModel(cityCode: "yokohama", cityName: "横浜"))
        list.append(CityModel(cityCode: "shizuoka", cityName: "静岡"))
        list.append(CityModel(cityCode: "nagoya", cityName: "名古屋"))
        list.append(CityModel(cityCode: "kyoto", cityName: "京都"))
        list.append(CityModel(cityCode: "osaka", cityName: "大阪"))
        list.append(CityModel(cityCode: "kobe", cityName: "神戸"))
        list.append(CityModel(cityCode: "hiroshima", cityName: "広島"))
        list.append(CityModel(cityCode: "fukuoka", cityName: "福岡"))
        list.append(CityModel(cityCode: "naha", cityName: "那覇"))
        
    }
}
