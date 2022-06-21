//
//  FullStatsViewController.swift
//  Individual volleyball stats
//
//  Created by Brian Seaver on 6/18/22.
//

import UIKit

class FullStatsViewController: UIViewController {

    var selectedGame : Game!
    @IBOutlet var attacksOutlet: [UILabel]!
    @IBOutlet var killsOutlet: [UILabel]!
    @IBOutlet var attackErrsOutlet: [UILabel]!
    @IBOutlet var hitPctsOutlet: [UILabel]!
    @IBOutlet var assistAttsOutlet: [UILabel]!
    @IBOutlet var assistsOutlet: [UILabel]!
    @IBOutlet var ballErrsOutlet: [UILabel]!
    @IBOutlet var soloBlocksOutlet: [UILabel]!
    @IBOutlet var blockAsstsOutlet: [UILabel]!
    @IBOutlet var digsOutlet: [UILabel]!
    @IBOutlet var servesOutlet: [UILabel]!
    @IBOutlet var serveErrsOutlet: [UILabel]!
    @IBOutlet var acesOutlet: [UILabel]!
    @IBOutlet var servePctsOutlet: [UILabel]!
    @IBOutlet var serveRcvAvgsOutlet: [UILabel]!
    
    @IBOutlet weak var athleteOutlet: UILabel!
    @IBOutlet weak var opponentOutlet: UILabel!
    
    
    @IBOutlet var scoreOutlets: [UILabel]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        athleteOutlet.text = selectedGame.athleteName
        opponentOutlet.text = selectedGame.gameName
        
//**** Scores ****
        for i in 0 ..< scoreOutlets.count{
            var set = selectedGame.sets[i]
            if let ns = set.nameScore, let os = set.opponentScore{
            if ns != 0 && os != 0{
                scoreOutlets[i].text = "\(ns)-\(os)"
            }
            else{
                scoreOutlets[i].text = ""
            }
            }
            else{
                scoreOutlets[i].text = ""
            }
            
        }
        
//***** Attacks ******
        var attacks = 0
        for i in 0 ..< attacksOutlet.count - 1{
            attacksOutlet[i].text = "\(selectedGame.sets[i].attack)"
            attacks += selectedGame.sets[i].attack
        }
        attacksOutlet[5].text = "\(attacks)"
        
//**** Kills ****
        var kills = 0
        for i in 0 ..< killsOutlet.count - 1{
            killsOutlet[i].text = "\(selectedGame.sets[i].kill)"
            kills += selectedGame.sets[i].kill
        }
        killsOutlet[5].text = "\(kills)"

//**** AttackErrs ****
        var attackErrs = 0
        for i in 0 ..< attackErrsOutlet.count - 1{
            attackErrsOutlet[i].text = "\(selectedGame.sets[i].attackErr)"
            attackErrs += selectedGame.sets[i].attackErr
        }
        attackErrsOutlet[5].text = "\(attackErrs)"
        
        
//**** Hit % ****
        for i in 0 ..< hitPctsOutlet.count - 1{
            var set = selectedGame.sets[i]
            if set.attack != 0{
                var hitPercentage = (Double(set.kill - set.attackErr))/Double(set.attack)
                var hitPercentString = String(format: "%.3f", hitPercentage)
                hitPctsOutlet[i].text = "\(hitPercentString)"
            }
            else{
                hitPctsOutlet[i].text = ".000"
            }
        }
        if attacks != 0{
            var hitPercentage = (Double(kills - attackErrs))/Double(attacks)
            var hitPercentString = String(format: "%.3f", hitPercentage)
            hitPctsOutlet[5].text = "\(hitPercentString)"
        }
        else{
            hitPctsOutlet[5].text = ".000"
        }
        
//**** Assist Atts ****
        var assistAtts = 0
        for i in 0 ..< assistAttsOutlet.count - 1{
            assistAttsOutlet[i].text = "\(selectedGame.sets[i].assistAtt)"
            assistAtts += selectedGame.sets[i].assistAtt
        }
        assistAttsOutlet[5].text = "\(assistAtts)"
        
//**** Assists ****
        var assists = 0
        for i in 0 ..< assistsOutlet.count - 1{
            assistsOutlet[i].text = "\(selectedGame.sets[i].assist)"
            assists += selectedGame.sets[i].assist
        }
        assistsOutlet[5].text = "\(assists)"
        
// **** Ball Errs ****
        var ballErrs = 0
        for i in 0 ..< ballErrsOutlet.count - 1{
            ballErrsOutlet[i].text = "\(selectedGame.sets[i].ballHandErr)"
            ballErrs += selectedGame.sets[i].ballHandErr
        }
        ballErrsOutlet[5].text = "\(ballErrs)"
        
// **** Solo Blocks ****
        var soloBlocks = 0
        for i in 0 ..< soloBlocksOutlet.count - 1{
            soloBlocksOutlet[i].text = "\(selectedGame.sets[i].soloBlock)"
            soloBlocks += selectedGame.sets[i].soloBlock
        }
        soloBlocksOutlet[5].text = "\(soloBlocks)"
        
// ****Block Assts ****
        var blockAssts = 0
        for i in 0 ..< blockAsstsOutlet.count - 1{
           blockAsstsOutlet[i].text = "\(selectedGame.sets[i].blockAsst)"
            blockAssts += selectedGame.sets[i].blockAsst
        }
        blockAsstsOutlet[5].text = "\(blockAssts)"
        
// **** Digs ****
        var digs = 0
        for i in 0 ..< digsOutlet.count - 1{
           digsOutlet[i].text = "\(selectedGame.sets[i].dig)"
            digs += selectedGame.sets[i].dig
        }
       digsOutlet[5].text = "\(digs)"
        
//  **** Serves ****
        var serves = 0
        for i in 0 ..< servesOutlet.count - 1{
           servesOutlet[i].text = "\(selectedGame.sets[i].serveAtt)"
            serves += selectedGame.sets[i].serveAtt
        }
       servesOutlet[5].text = "\(serves)"
        
//**** ServeErr ****
        var serveErrs = 0
        for i in 0 ..< serveErrsOutlet.count - 1{
           serveErrsOutlet[i].text = "\(selectedGame.sets[i].serveErr)"
           serveErrs += selectedGame.sets[i].serveErr
        }
       serveErrsOutlet[5].text = "\(serveErrs)"
        
//**** Aces ****
        var aces = 0
        for i in 0 ..< acesOutlet.count - 1{
           acesOutlet[i].text = "\(selectedGame.sets[i].ace)"
           aces += selectedGame.sets[i].ace
        }
       acesOutlet[5].text = "\(aces)"
        
// **** Serve% ****
        for i in 0 ..< servePctsOutlet.count - 1{
            var set = selectedGame.sets[i]
            if set.serveAtt != 0{
                var servePercentage = Int(round((Double(set.serveAtt - set.serveErr))/Double(set.serveAtt) * 100))
               
                servePctsOutlet[i].text = "\(servePercentage)%"
            }
            else{
                servePctsOutlet[i].text = "NA"
            }
        }
        
        if serves != 0{
            var servePercentage = Int(round((Double(serves - serveErrs))/Double(serves) * 100))
           
            servePctsOutlet[5].text = "\(servePercentage)%"
        }
        else{
            servePctsOutlet[5].text = "NA"
        }
        
// **** S. Receive Avg ****
        var zeros = 0
        var ones = 0
        var twos = 0
        var threes = 0
        var totalServesTotal = 0
        var totalTotal = 0.0
        for i in 0 ..< serveRcvAvgsOutlet.count - 1{
            var set = selectedGame.sets[i]
            zeros += set.zero
            ones += set.one
            twos += set.two
            threes += set.three
        var totalServes = set.one + set.two + set.three + set.zero
            totalServesTotal += totalServes
        if totalServes != 0{
            var total = Double(set.one + 2 * set.two + 3 * set.three)
            totalTotal += total
            var avg = total / Double(totalServes)
            var avgString = String(format: "%.2f", avg)
            serveRcvAvgsOutlet[i].text = "\(avgString)"
        }
        else{
            serveRcvAvgsOutlet[i].text = "0.00"
        }
        }
        
        if totalServesTotal != 0{
            var avg = totalTotal / Double(totalServesTotal)
            var avgString = String(format: "%.2f", avg)
            serveRcvAvgsOutlet[5].text = "\(avgString)"
            
        }
        else{
            serveRcvAvgsOutlet[5].text = "0.00"
        }
        
        
    }
    

  

}
