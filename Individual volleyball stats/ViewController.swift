//
//  ViewController.swift
//  Individual volleyball stats
//
//  Created by Brian Seaver on 6/17/22.
//

import UIKit

class AppData{
    static var games = [Game]()
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    var selectedGame = Game()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        
        if let items = UserDefaults.standard.data(forKey: "games") {
            print("number of items \(items.count)")
                        let decoder = JSONDecoder()
                        if let decoded = try? decoder.decode([Game].self, from: items) {
                            AppData.games = decoded
                            print("number of my games \(AppData.games.count)")
                        }
           
                }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableViewOutlet.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AppData.games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "myCell") as! GameViewCell
        cell.configure(game: AppData.games[indexPath.row])
        if indexPath.row % 2 == 0{
            cell.backgroundColor = UIColor.white
        
        }
        else{
            cell.backgroundColor = UIColor.lightGray
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedGame = AppData.games[indexPath.row]
        performSegue(withIdentifier: "toStats", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! StatsEntryViewController
        nvc.selectedGame = selectedGame
    }

    @IBAction func newGameAction(_ sender: UIBarButtonItem) {
        selectedGame = Game()
        AppData.games.append(selectedGame)
        performSegue(withIdentifier: "toStats", sender: self)
    }
    
    
    
}

