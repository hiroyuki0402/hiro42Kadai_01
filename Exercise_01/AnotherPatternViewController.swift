//
//  AnotherPatternViewController.swift
//  Exercise_01
//
//  Created by 白石裕幸 on 2021/08/11.
//

import UIKit
/// 課題別パターン
class AnotherPatternViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet private var resultLabel: UILabel!
    @IBOutlet private var calculationButtonObj: UIButton!
    
    // TextFieldの数
    private let requiredNumber = 5 // 今回の課題の数分
    private var textFields = [UITextField]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTextFields()
        calculationButtonObj.anchor(top: textFields.last?.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 30, topPadding: 20, leftPadding: 20, rightPadding: UIScreen.main.bounds.width / 2)
        resultLabel.anchor(top: calculationButtonObj.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 50, topPadding: 20, leftPadding: 20, rightPadding: UIScreen.main.bounds.width / 3)
        // Do any additional setup after loading the view.
    }

    // MARK:METHODs
    
    /// 計算実行
    @IBAction func calculationButton(_ sender: Any) {
        calculate()
    }
    /// textField生成
    private func generateTextFields() {
        for i in 0..<requiredNumber {
            let textField = UITextField().textFieldLayout()
            textField.delegate = self
            textFields.append(textField)
            view.addSubview(textField)
            textField.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor,centerX: view.centerXAnchor, height: 30, topPadding: 50 + CGFloat(i * 50), leftPadding: 20, rightPadding: 20)
            }
        }
    /// 計算処理
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



extension UITextField {
    func textFieldLayout() -> UITextField {
        borderStyle = .roundedRect
        layer.borderColor = UIColor.lightGray.cgColor
        textColor = .black
        backgroundColor = .lightGray
        keyboardType = .numberPad
        return self
    }
}
extension UIView {
    func anchor(
        top: NSLayoutYAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        left: NSLayoutXAxisAnchor? = nil,
        right: NSLayoutXAxisAnchor? = nil,
        centerY: NSLayoutYAxisAnchor? = nil,
        centerX: NSLayoutXAxisAnchor? = nil,
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        topPadding: CGFloat = 0,
        bottomPadding: CGFloat = 0,
        leftPadding: CGFloat = 0,
        rightPadding: CGFloat = 0) {

        self.translatesAutoresizingMaskIntoConstraints = false

        if let top = top {
            topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
        }

        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -bottomPadding).isActive = true
        }

        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: leftPadding).isActive = true
        }

        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -rightPadding).isActive = true
        }

        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }

        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }

        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}



