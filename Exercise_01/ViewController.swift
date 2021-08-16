//
//  ViewController.swift
//  Exercise_01
//
//  Created by 白石裕幸 on 2021/08/11.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var textField01: UITextField!
    @IBOutlet var textField02: UITextField!
    @IBOutlet var textField03: UITextField!
    @IBOutlet var textField04: UITextField!
    @IBOutlet var textField05: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate()
        // Do any additional setup after loading the view.
    }
    
    
    
    // MARK:Method
    
    /// 計算処理
    @IBAction func calculationButton(_ sender: Any) {

        let val01 = Int(textField01.text!) ?? 0
        let val02 = Int(textField02.text!) ?? 0
        let val03 = Int(textField03.text!) ?? 0
        let val04 = Int(textField04.text!) ?? 0
        let val05 = Int(textField05.text!) ?? 0

        let result = val01 + val02 + val03 + val04 + val05
        resultLabel.text = String(result)
        
    }
    
    private func delegate(){
        textField01.delegate = self
        textField02.delegate = self
        textField03.delegate = self
        textField04.delegate = self
        textField05.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    ///
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
    }
}

