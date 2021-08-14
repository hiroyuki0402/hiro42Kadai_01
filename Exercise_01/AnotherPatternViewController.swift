//
//  AnotherPatternViewController.swift
//  Exercise_01
//
//  Created by 白石裕幸 on 2021/08/11.
//

import UIKit
//課題別パターン
class AnotherPatternViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet private var resultLabel: UILabel!
    
    //TextFieldの数
    private let requiredNumber = 5 //今回の課題の数分
    private var textFields = [UITextField]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTextFields()
    }

    //MARK:METHODs
    
    //計算実行
    @IBAction func calculationButton(_ sender: Any) {
        calculate()
    }

    //textField生成
    private func generateTextFields() {
        for i in 0..<requiredNumber {
            let textField = UITextField().textFieldLayout(i: i)
            textField.delegate = self
            textFields.append(textField)
            view.addSubview(textField)
        }
    }

    ///計算処理
    private func calculate() {
        var result = 0

        textFields.forEach {
            result += Int($0.text!) ?? 0
        }

        resultLabel.text = String(result)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
    }
}



extension UITextField{
    func textFieldLayout(i: Int) -> UITextField {
        borderStyle = .roundedRect
        layer.borderColor = UIColor.lightGray.cgColor
        textColor = .black
        backgroundColor = .lightGray
        keyboardType = .numberPad
        frame = CGRect(x: 20, y: 100 + i * 40, width: 250, height: 30)
        return self
    }
}
