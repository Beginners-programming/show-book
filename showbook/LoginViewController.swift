//
//  LoginViewController.swift
//  showbook
//
//  Created by Binay Budhthoki on 11/18/17.
//  Copyright © 2017 Mojo Monkies. All rights reserved.
//

import UIKit
import CleanroomLogger

class LoginViewController: BaseViewController, UITextFieldDelegate {

    @IBOutlet weak var loginEmailTextField: UITextField!
    var mojoShow: Show?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginEmailTextField.delegate = self
        self.mojoShow = Show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        Log.info?.message("Touches Began - Outside of the textview")
        //loginEmailTextField.resignFirstResponder()
        self.view.endEditing(true)
    }
    
    @IBAction func btnLoginPressed(_ sender: Any) {
        Log.info?.message("Login Button Pressed")
        
        let email = loginEmailTextField.text
        Log.info?.message("Login Email: \(String(describing: email))")
        
        do {
            try mojoShow?.setEmail(email: email!)
        } catch ShowValidationError.InvalidEmail {
            super.notifyUser(msgTitle: "Invalid Entry.", msgTxt: "Login Email is empty.")
        } catch {
            Log.info?.message("More Errors")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueTheaterTable") {
            let theaterTable = segue.destination as! TheaterTable
            theaterTable.mojoShow = mojoShow
        }
    }
}
