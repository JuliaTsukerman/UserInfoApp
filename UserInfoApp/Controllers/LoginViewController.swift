//
//  LoginViewController.swift
//  UserInfoApp
//
//  Created by Test on 10/31/21.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Private properties
  private  var userName = "A"
   private var userPassword = "1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else {return}
        for viewController in viewControllers {
                    if let welcomeVC = viewController as? WelcomeViewController {
                        welcomeVC.user = userName
        }
            
        }
    }
  
    // MARK: IBActions
    
    @IBAction func loginButtonPress() {
        
    if loginTextField.text != userName || passwordTextField.text != userPassword {
      showAlert(
            title: "Invalid login or password",
            message: "Please, enter correct login and password",
            textField: passwordTextField
        )
    }
    }
    
    @IBAction func forgotUserData(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(title: "Oops!", message: "Your name is \(userName) 😉")
            : showAlert(title: "Oops!", message: "Your password is \(userPassword) 😉")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
}

extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField
        {
            passwordTextField.becomeFirstResponder()
        } else {
            loginButtonPress()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
}
