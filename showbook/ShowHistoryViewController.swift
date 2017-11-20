//
//  ShowHistoryViewController.swift
//  showbook
//
//  Created by Binay Budhthoki on 11/19/17.
//  Copyright © 2017 Mojo Monkies. All rights reserved.
//

import UIKit
import CleanroomLogger

class ShowHistoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Log.info?.message("Show History View Controller View Did Load")
        
        Show.retrieve()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    static func storyboardInstance() -> ShowHistoryViewController? {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: self))
        return controller as? ShowHistoryViewController
    }
    
   
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
