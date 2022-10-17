//
//  ViewController.swift
//  CreateUserApp
//
//  Created by Carlos Alcala on 17/10/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var repasswordField: UITextField!
    @IBAction func buttonTapped(_ sender: UIButton) {
        registerButtonTapped()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func registerButtonTapped() {

        if validateEmailUser(email: usernameField.text ?? "") == false {
            showAlert(message: "Enter valid Email", title: "Error Email")
        } else if validatePassword(password: passwordField.text ?? "") == false {
            showAlert(message: "Enter valid Password", title: "Error Password")
        } else if passwordField.text != repasswordField.text {
            showAlert(message: "Password and Confirnm Password does not the same", title: "Error Confirm password")
        } else {
            showAlert(message: "User Created", title: "Success")
        }
    }

    private func showAlert(message: String, title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
    }

    func validateEmailUser(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    func validatePassword(password: String) -> Bool {

        let passwordRegEx = "^.*(?=.{6,})(?=.*[A-Z])(?=.*[a-zA-Z])(?=.*\\d)|(?=.*[!#$%&?]).*$"

        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password)
    }

}
