//
//  ViewController.swift
//  WeatherService
//
//  Created by 天野修一 on 2020/11/29.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        createAreaPicker()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }

    
//class変数
    let pickerView = UIPickerView()
    
    //変数にデータの初期値を入れておく
    var cityData:[String] = ["tokyo", "東京"]

    //cityModelのデータをインスタンスで持ってくる
    let cityList = CityList()
    
    
    //Pickerの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Pickerの要素の数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cityList.list.count
    }
    
    //Pickerに表示するデータ
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cityList.list[row].name
    }
    
    //Pickerで選ばれた要素のデータ(codeとname)の送信
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cityData = [cityList.list[row].code,cityList.list[row].name]
        //print(cityData)
    }
    
    
    
    
    //コードでPickerを作成(コードの複雑化を回避するためのfunc)
    func createAreaPicker(){
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        //バーボタン
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        
        //assign
        areaTextField.inputAccessoryView = toolbar
        
        // pickerViewをareaTextFieldに反映
        areaTextField.inputView = pickerView
        
    }
    
    
    
    //ボタンが押されたときの挙動
    @objc func donePressed() {
        
        //pickerで選ばれた値(name)をテキストフィールドに写す(配列cityDataの値を指定)
        //codeが0、nameが1番目なので、ここではint型で1と指定
        areaTextField.text = cityData[1]
        
        areaTextField.textAlignment = .center
        
        //pickerViewの表示を終了
        self.view.endEditing(true)
    }
    
    //toolbar上のボタンを押すかキーボード以外の場所をタップしたときにキーボードを非表示にする
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            areaTextField.endEditing(true)
        }
    
    
    //次の画面にデータを渡す処理を書く
    //prepareは、segueが動作するとViewControllerに通知してくれる
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "result" {
                
                //resultViewController(次の画面)で作った変数に、pickerで選択した地域の情報を入れる
                let resultVC = segue.destination as! ResultViewController
              resultVC.cityData = cityData
        
            }
        }
    
//紐付け
    @IBAction func resultButton(_ sender: Any) {
        
        performSegue(withIdentifier: "result", sender: nil)

    }
    
    @IBOutlet var areaTextField: UITextField!
    
    
}
