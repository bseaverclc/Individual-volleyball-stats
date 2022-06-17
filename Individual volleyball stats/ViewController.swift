//
//  ViewController.swift
//  Individual volleyball stats
//
//  Created by Brian Seaver on 6/17/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    var games = [Game]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "myCell") as! UITableViewCell
        if indexPath.row % 2 == 0{
            cell.backgroundColor = UIColor.white
        
        }
        else{
            cell.backgroundColor = UIColor.lightGray
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toStats", sender: self)
    }


}

