//
//  AnotherPatternViewController.swift
//  Exercise_01
//
//  Created by 白石裕幸 on 2021/08/11.
//

import UIKit
//課題別パターン
class AnotherPatternViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var resultLabel: UILabel!
    
    //TextFieldの数
    private var requiredNumber = 5 //今回の課題の数分
    private var textFields = [UITextField]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldGeneration()
        // Do any additional setup after loading the view.
    }

    //MARK:METHODs
    
    //計算実行
    @IBAction func calculationButton(_ sender: Any){
        calculation()
    }
    //textField生成
    private func textFieldGeneration(){
        for i in 0..<requiredNumber {
            let textField = UITextField().textFieldLayout(i: i)
            textField.delegate = self
            textFields.append(textField)
            self.view.addSubview(textField)
        }
    }
    ///計算処理
    private func calculation(){
        var result = Int()
        for i in 0..<textFields.count{
            result += Int(textFields[i].text!) ?? 0
        }
        resultLabel.text = String(result)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
    }
}



extension UITextField{
    func textFieldLayout(i:Int) -> UITextField{
        self.borderStyle = .roundedRect
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.textColor = .black
        self.backgroundColor = .lightGray
        self.keyboardType = .numberPad
        self.frame = CGRect(x: 20, y: 100 + i * 40, width: 250, height: 30)
        return self
    }
}
