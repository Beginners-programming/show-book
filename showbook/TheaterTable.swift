//
//  TheaterTable.swift
//  showbook
//
//  Created by Binay Budhthoki on 11/16/17.
//  Copyright © 2017 Mojo Monkies. All rights reserved.
//

import UIKit
import CleanroomLogger

class TheaterTable: UITableViewController {
    
    var theater:Array<String> = []
    let sections:Int = 1
    var selectedTheater:String = ""
    
    var mojoShow: Show?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.theater.append("QFX Jai Nepal")
        self.theater.append("QFX Civil Mall")
        self.theater.append("QFX Labim Mall")
        self.theater.append("QFX Kumari")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theater.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "theaterCellReuse", for: indexPath)
        
        let theaterTitle = theater[indexPath.row]
        cell.textLabel?.text = theaterTitle

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedTheater = theater[indexPath.row]
        Log.info?.message("Selected Theater: \(selectedTheater)")

        self.performSegue(withIdentifier: "segueTheaterDetail", sender: self)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueTheaterDetail") {
            let theaterDetailViewController = segue.destination as! TheaterDetail
            theaterDetailViewController.selectedTheater = self.selectedTheater
            theaterDetailViewController.mojoShow = self.mojoShow
        }
    }
}
