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
        if let oldDate = Calendar.current.date(byAdding: .year, value: -7, to: Date()) {
           // Use this date
        
        
            AppData.games = AppData.games.sorted(by: { $0.date ?? oldDate > $1.date ?? oldDate })
      
        }
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
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            let alert = UIAlertController(title: "Alert!", message: "Are you sure you want to delete this game?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { a in
                
                
                AppData.games.remove(at: indexPath.row)
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(AppData.games) {
                                   UserDefaults.standard.set(encoded, forKey: "games")
                               }
                
                tableView.reloadData()
                
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
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

