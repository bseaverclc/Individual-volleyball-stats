//
//  Game.swift
//  Individual volleyball stats
//
//  Created by Brian Seaver on 6/17/22.
//

import Foundation

class Game: Codable{
    var gameName = ""
    var athleteName  = ""
    var sets = [ASet(), ASet(), ASet(), ASet(), ASet()]
   
    
  
}

class ASet: Codable{
    var attack = 0
    var kill = 0
    var attackErr = 0
    
    var assistAtt = 0
    var assist = 0
    var ballHandErr = 0
    
    var soloBlock = 0
    var blockAsst = 0
    
    var dig = 0
    var serveAtt = 0
    var serveErr = 0
    var ace = 0
    
    var hitPct = 0.0
    var serveReceiveAvg = 0.0
    
}
