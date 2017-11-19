//
//  BaseViewController.swift
//  showbook
//
//  Created by Binay Budhthoki on 11/18/17.
//  Copyright © 2017 Mojo Monkies. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func notifyUser(msgTitle: String, msgTxt: String) {
        let alert = UIAlertController(title: msgTitle , message: msgTxt, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
