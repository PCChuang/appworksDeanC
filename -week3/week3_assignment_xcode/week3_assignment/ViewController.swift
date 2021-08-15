//
//  ViewController.swift
//  week3_assignment
//
//  Created by PoChieh Chuang on 2021/8/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkTextField: UITextField!
    @IBOutlet weak var checkLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var loginSegmentedControl: UISegmentedControl!
    
    
    let login = LoginEntry()
    
    @IBAction func changePage(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            login.type = .login
            disableCheckTextField()
        case 1:
            login.type = .signup
            enableCheckTextField()
        default:
            break
        }
    }
    
    
    @IBAction func sendLoginRequest(_ sender: UIButton) {
        updateLogin()

        switch login.type {
        case .login:
            if login.account.isEmpty {
                showAccountAlert()
            } else if login.password.isEmpty {
                showPasswordAlert()
            } else {
                acceptAccount()
            }
        case .signup:
            if login.account.isEmpty {
                showAccountAlert()
            } else if login.password.isEmpty {
                showPasswordAlert()
            } else if login.check.isEmpty {
                showCheckAlert()
            } else if login.check != login.password {
                checkPassword()
            } else {
                updateLogin()
            }
        }


    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loginSegmentedControl.backgroundColor = UIColor.white
        loginSegmentedControl.layer.borderColor = UIColor.black.cgColor
        loginSegmentedControl.selectedSegmentTintColor = UIColor.black
        loginSegmentedControl.layer.borderWidth = 1

        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        loginSegmentedControl.setTitleTextAttributes(titleTextAttributes, for:.normal)

        let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.white]
        loginSegmentedControl.setTitleTextAttributes(titleTextAttributes1, for:.selected)
        
        fixBackgroundSegmentControl(loginSegmentedControl)
        
    }
    
    func updateLogin() {
        login.account = accountTextField.text ?? ""
        login.password = passwordTextField.text ?? ""
        login.check = checkTextField.text ?? ""
    }
    
    func acceptAccount() {
        updateLogin()
        if
        login.account == "appworks_school@gmail.com",
        login.password == "1234" {
            let accpetAlert = UIAlertController(title: "Welcome!", message: "You've logged in succesfully.", preferredStyle: .alert)
            let accpetAction = UIAlertAction(title: "Got it!", style: .default, handler: { action in

            })
            accpetAlert.addAction(accpetAction)
            present(accpetAlert, animated: true)
        } else if
        login.account != "appworks_school@gmail.com" ||
        login.password != "1234" {
            let loginFailAlert = UIAlertController(title: "Error", message: "Login fail", preferredStyle: .alert)
            let loginFailAction = UIAlertAction(title: "OK", style: .default, handler: { action in

            })
            loginFailAlert.addAction(loginFailAction)
            present(loginFailAlert, animated: true)
        }

        
    }
    
    func enableCheckTextField() {
        checkLabel.textColor = UIColor.black
        checkTextField.backgroundColor = UIColor.white
        checkTextField.isUserInteractionEnabled = true
    }
    
    func disableCheckTextField() {
        checkLabel.textColor = UIColor.gray
        checkTextField.backgroundColor = UIColor.gray
        checkTextField.isUserInteractionEnabled = false
    }
    
    func showAccountAlert() {
        let accountAlert = UIAlertController(title: "Error", message: "Account should not be empty.", preferredStyle: .alert)
        let accountAction = UIAlertAction(title: "OK", style: .default, handler: { action in

        })
        accountAlert.addAction(accountAction)
        present(accountAlert, animated: true)
    }
    
    func showPasswordAlert() {
        let passwordAlert = UIAlertController(title: "Error", message: "Password should not be empty.", preferredStyle: .alert)
        let passwordAction = UIAlertAction(title: "OK", style: .default, handler: { action in

        })
        passwordAlert.addAction(passwordAction)
        present(passwordAlert, animated: true)
    }
    
    func showCheckAlert() {
        let checkAlert = UIAlertController(title: "Error", message: "Check Password should not be empty.", preferredStyle: .alert)
        let checkAction = UIAlertAction(title: "OK", style: .default, handler: { action in

        })
        checkAlert.addAction(checkAction)
        present(checkAlert, animated: true)
    }
    
    func checkPassword() {
            let checkPasswordAlert = UIAlertController(title: "Error", message: "Signup fail", preferredStyle: .alert)
            let checkPasswordAction = UIAlertAction(title: "OK", style: .default, handler: { action in

            })
            checkPasswordAlert.addAction(checkPasswordAction)
            present(checkPasswordAlert, animated: true)
    }
    
    func fixBackgroundSegmentControl( _ segmentControl: UISegmentedControl){
        if #available(iOS 13.0, *) {
            //just to be sure it is full loaded
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                for i in 0...(segmentControl.numberOfSegments-1)  {
                    let backgroundSegmentView = segmentControl.subviews[i]

                    backgroundSegmentView.isHidden = true
                }
            }
        }
    }


}


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

