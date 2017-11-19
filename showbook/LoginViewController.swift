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
        Log.info?.message("## Email Login Module ##")
        
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
    
    
    @IBAction func btnBookingHistoryPressed(_ sender: Any) {
        Log.info?.message("## Booking History Module ##")
        
        if let nextViewController = ShowHistoryViewController.storyboardInstance() {
            
            // initialize all your class properties
            // homeViewController.property1 = …
            // homeViewController.property2 = …
            // either push or present the nextViewController,
            // depending on your navigation structure
            // present present(nextViewController, animated: true, completion: nil)
            // or push
            
            navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            Log.error?.message("Show History View Controller - Initialization Failed")
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueTheaterTable") {
            let theaterTable = segue.destination as! TheaterTable
            theaterTable.mojoShow = mojoShow
        }
    }
}
