//
//  ResultViewController.swift
//  WeatherService
//
//  Created by 天野修一 on 2020/11/30.
//

import UIKit
import Alamofire
import SwiftyJSON

import Foundation

class ResultViewController: UIViewController {


//class変数
    let apiKey = "b37b96f2516d2efd8f35792eedb69c11" //各々のキーを書き換えてください！
    
    var cityData: [String] = ["osaka","大阪"] //いちおう初期値を入れておく
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "\(cityData[1])の天気"
        getWeatherData()

    }
    
    
//天気情報を取得する。
    private func getWeatherData() {

            //前の画面から渡されたデータのcodeを、urlに組み込みます。
        let baseURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(apiKey)&q=\(cityData[0])"

        //print(baseURL)
        //Alamofireの使用コード
        AF.request(baseURL, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON {

            (response) in
    
            switch response.result {
            //APIデータを取得できた場合
            case .success:
                
                let jsonResponse = JSON(response.data as Any)
                
                let jsonWeather = jsonResponse["weather"].array![0]
                
                let jsonTemp = jsonResponse["main"]
                
                
                self.conditionLabel.text = jsonWeather["main"].stringValue
                
                //摂氏温度に変換
                let celsius = Int(round(jsonTemp["temp"].doubleValue - 273.15 ))
                
                //print(jsonTemp)
                //print(celsius)
                self.temperatureLabel.text = "\(celsius)℃"
                
            
                //print(jsonWeather)
                
            //APIデータを取得できなかった場合
            case .failure(_):
                print("-------- エラー ------")
                
            }
        }
    }
    
//紐付け
    //タイトルのラベル
    @IBOutlet var titleLabel: UILabel!
    
    //天候のラベル
    @IBOutlet var conditionLabel: UILabel!
    
    //温度のラベル
    @IBOutlet var temperatureLabel: UILabel!
    
    //戻るボタン
    @IBAction func backButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    }
