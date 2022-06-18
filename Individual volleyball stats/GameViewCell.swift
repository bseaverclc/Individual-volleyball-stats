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
        for set in game.sets{
            kills += set.kill
            attacks += set.attack
            attackErrs += set.attackErr
        }
        
        
        KillsOutlet.text = "\(kills)"
        
        
    }
    
    
    
    
    
}
