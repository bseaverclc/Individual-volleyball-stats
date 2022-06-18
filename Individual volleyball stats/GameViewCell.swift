//
//  GameViewCell.swift
//  Individual volleyball stats
//
//  Created by Brian Seaver on 6/17/22.
//

import Foundation
import UIKit

class GameViewCell: UITableViewCell{
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
        }
        
        if attacks != 0{
            var hitPercentage = (Double(kills - attackErrs))/Double(attacks)
            var hitPercentString = String(format: "%.3f", hitPercentage)
            hitPctOutlet.text = "\(hitPercentString)"
        }
        
        var totalServes = ones + twos + threes + zeros
        if totalServes != 0{
            var total = Double(ones + 2 * twos + 3 * threes)
            var avg = total / Double(totalServes)
            var avgString = String(format: "%.2f", avg)
           serveReceiveOutlet.text = "\(avgString)"
        }
        else{
            serveReceiveOutlet.text = "0.00"
        }
       
        
        athleteNameOutlet.text = game.athleteName
        gameNameOutlet.text = game.gameName
        KillsOutlet.text = "\(kills)"
        acesOutlet.text = "\(aces)"
        blocksOutlet.text = "\(blocks)"
        digsOutlet.text = "\(digs)"
        assistsOutlet.text = "\(assists)"
        //winOutlet.text = "\(win)"
        
        
    }
    
    
    
    
    
}
