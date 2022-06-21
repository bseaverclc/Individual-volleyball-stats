//
//  GameViewCell.swift
//  Individual volleyball stats
//
//  Created by Brian Seaver on 6/17/22.
//

import Foundation
import UIKit

class GameViewCell: UITableViewCell{
    
    @IBOutlet weak var dateOutlet: UILabel!
    
    @IBOutlet weak var athleteNameOutlet: UILabel!
    @IBOutlet weak var gameNameOutlet: UILabel!
    
   
    
    @IBOutlet weak var KillsOutlet: UILabel!
    @IBOutlet weak var acesOutlet: UILabel!
    @IBOutlet weak var blocksOutlet: UILabel!
    @IBOutlet weak var digsOutlet: UILabel!
    @IBOutlet weak var assistsOutlet: UILabel!
    @IBOutlet weak var winOutlet: UILabel!
    @IBOutlet weak var hitPctOutlet: UILabel!
    @IBOutlet weak var serveReceiveOutlet: UILabel!
    
    @IBOutlet weak var servePctOutlet: UILabel!
    
    func configure(game : Game){
        var kills = 0
        var attacks = 0
        var attackErrs = 0
        var aces = 0
        var blocks = 0
        var digs = 0
        var assists = 0
        var zeros = 0
        var ones = 0
        var twos = 0
        var threes = 0
        var win = "Win"
        var serves = 0
        var serveErrors = 0
        var setsWon = 0
        var setsLost = 0
        
        
        
        
        for set in game.sets{
            kills += set.kill
            attacks += set.attack
            attackErrs += set.attackErr
            
            aces += set.ace
            blocks += set.blockAsst + set.soloBlock
            digs += set.dig
            assists += set.assist
            zeros += set.zero
            ones += set.one
            twos += set.two
            threes += set.three
            
            serves += set.serveAtt
            serveErrors += set.serveErr
            if let ns = set.nameScore, let os = set.opponentScore{
                if ns > os{
                    setsWon += 1
                }
                if ns < os{
                    setsLost += 1
                }
            }
        }
        
        if attacks != 0{
            var hitPercentage = (Double(kills - attackErrs))/Double(attacks)
            var hitPercentString = String(format: "%.3f", hitPercentage)
            hitPctOutlet.text = "\(hitPercentString)"
        }
        else{
            hitPctOutlet.text = "NA"
        }
        
        var totalServes = ones + twos + threes + zeros
        if totalServes != 0{
            var total = Double(ones + 2 * twos + 3 * threes)
            var avg = total / Double(totalServes)
            var avgString = String(format: "%.2f", avg)
           serveReceiveOutlet.text = "\(avgString)"
        }
        else{
            serveReceiveOutlet.text = "NA"
        }
        
        if serves != 0{
            var servePercentage = Int(round((Double(serves - serveErrors))/Double(serves) * 100.0))
            
            servePctOutlet.text = "\(servePercentage)%"
        }
        else{
            servePctOutlet.text = "NA"
        }
        
        if let d = game.date{
       
        let dateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "MM/D/YY"
        dateFormatter.dateStyle = .short

        let convertedDate = dateFormatter.string(from: d)
            dateOutlet.text = convertedDate
        }
        else{
            dateOutlet.text = "No Date"
        }
        
        if setsWon > setsLost{
            winOutlet.text = "W in \(setsWon + setsLost)"
            winOutlet.backgroundColor = UIColor.green
        }
        else if setsWon < setsLost{
            winOutlet.text = "L in \(setsWon + setsLost)"
            winOutlet.backgroundColor = UIColor.red
        }
        else{
            winOutlet.text = "?? in ?"
            winOutlet.backgroundColor = UIColor.clear
        }
        
        athleteNameOutlet.text = game.athleteName
        gameNameOutlet.text = "vs \(game.gameName)"
        KillsOutlet.text = "\(kills)"
        acesOutlet.text = "\(aces)"
        blocksOutlet.text = "\(blocks)"
        digsOutlet.text = "\(digs)"
        assistsOutlet.text = "\(assists)"
        //winOutlet.text = "\(win)"
        
        
        
        
    }
    
    
    
    
    
}
