//
//  AvgViewCellTableViewCell.swift
//  Individual volleyball stats
//
//  Created by Brian Seaver on 6/23/22.
//

import Foundation
import UIKit

class AvgViewCellTableViewCell: UITableViewCell {

   
    @IBOutlet weak var athleteNameAvgOutlet: UILabel!
    @IBOutlet weak var killSetLabel: UILabel!
    @IBOutlet weak var attackSetLabel: UILabel!
    @IBOutlet weak var acesSetLabel: UILabel!
    @IBOutlet weak var blocksSetLabel: UILabel!
    @IBOutlet weak var digsSetLabel: UILabel!
    @IBOutlet weak var assistsSetLabel: UILabel!
    
    @IBOutlet weak var hittingOverallLabel: UILabel!
    
    @IBOutlet weak var srvRecOverallLabel: UILabel!
    @IBOutlet weak var servePctOverallLabel: UILabel!
    
    
    func configure(name: String){
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
        var totalSets = 0
        
        for game in AppData.games{
            if game.athleteName == name{
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
                        if ns > 0 || os > 0{
                            totalSets += 1
                        }
                    }
                }
            }
        }
        
        
        
        
        if attacks != 0{
            var hitPercentage = (Double(kills - attackErrs))/Double(attacks)
            var hitPercentString = String(format: "%.3f", hitPercentage)
            hittingOverallLabel.text = "\(hitPercentString)"
        }
        else{
            hittingOverallLabel.text = "NA"
        }
        
        var totalServes = ones + twos + threes + zeros
        if totalServes != 0{
            var total = Double(ones + 2 * twos + 3 * threes)
            var avg = total / Double(totalServes)
            var avgString = String(format: "%.2f", avg)
           srvRecOverallLabel.text = "\(avgString)"
        }
        else{
            servePctOverallLabel.text = "NA"
        }
        
        if serves != 0{
            var servePercentage = Int(round((Double(serves - serveErrors))/Double(serves) * 100.0))
            
            servePctOverallLabel.text = "\(servePercentage)%"
        }
        else{
            servePctOverallLabel.text = "NA"
        }
        
        
        
        athleteNameAvgOutlet.text = name
        
        var avg = Double(kills) / Double(totalSets)
        killSetLabel.text = String(format: "%.2f", avg)
        avg = Double(attacks) / Double(totalSets)
        attackSetLabel.text = String(format: "%.2f", avg)
        avg = Double(aces) / Double(totalSets)
       acesSetLabel.text = String(format: "%.2f", avg)
        avg = Double(blocks) / Double(totalSets)
        blocksSetLabel.text = String(format: "%.2f", avg)
        avg = Double(digs) / Double(totalSets)
        digsSetLabel.text = String(format: "%.2f", avg)
        avg = Double(assists) / Double(totalSets)
        assistsSetLabel.text = String(format: "%.2f", avg)
        
      
        
        
        
        
    }
    
}
