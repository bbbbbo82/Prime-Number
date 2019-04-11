//
//  ViewController.swift
//  Prime Number
//
//  Created by D7703_23 on 2019. 4. 11..
//  Copyright © 2019년 D7703_23. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblA: UILabel!
    @IBOutlet weak var txtA: UITextField!
    
    @IBAction func btnCheck(_ sender: Any) {
        
        // optional binding(Conditional unwraping)을 사용하여 숫자값을 제외함
        if let number = Int(txtA.text!) {
            
            var isPrime = true
            
            // 입력 값이 0이거나 음수 일때 처리...
            if number <= 0 {
                lblA.text = "input correct value!"
                txtA.text = ""
                return
            }
            
            if number == 1 {
                isPrime = false
            }
            
            if number != 1 && number != 2 {
                for i in 2 ..< number {
                    if number % i == 0 {
                        isPrime = false
                    }
                }
            }
            
            if isPrime == true {
                lblA.text = "prime number 입니다"
            } else {
                lblA.text = "Prime number가 아닙니다"
            }
            txtA.text = ""
        }else {
            //숫자값이 입력됐을때
            print("nil발생")
            lblA.text = ""
            txtA.text = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtA.delegate = self as? UITextFieldDelegate
        txtA.placeholder = "ex) 7"
        txtA.clearButtonMode = UITextField.ViewMode.always
    }
    // background view를 누르면 키패드가 내려감
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }    
    // return 키를 누르면 키패드가 내려감
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtA.resignFirstResponder()
        return true
    }
    
}
