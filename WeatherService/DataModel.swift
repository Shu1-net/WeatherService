//
//  DataModel.swift
//  WeatherService
//
//  Created by 天野修一 on 2020/11/29.
//

import Foundation

struct cityModel {
//APIで取ってくるエリア情報の型を設定する
    
    //地域の名前とURLを追加するプロパティを持つ
        let code: String
        let name: String

        init(cityCode:String, cityName:String) {
            code = cityCode
            name = cityName
        }
    
}
