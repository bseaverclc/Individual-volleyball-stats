//
//  StatsEntryViewController.swift
//  Individual volleyball stats
//
//  Created by Brian Seaver on 6/17/22.
//

import UIKit

class StatsEntryViewController: UIViewController {
    

    @IBOutlet weak var attackLabelOutlet: UILabel!
    @IBOutlet weak var killLabelOutlet: UILabel!
    @IBOutlet weak var AttackErrLabelOutlet: UILabel!
    @IBOutlet weak var AssistAttLabelOutlet: UILabel!
    @IBOutlet weak var AssistLabelOutlet: UILabel!
    @IBOutlet weak var BallHandErrLabelOutlet: UILabel!
    @IBOutlet weak var soloBlockLabelOutlet: UILabel!
    @IBOutlet weak var blockAsstLabelOutlet: UILabel!
    @IBOutlet weak var digLabelOutlet: UILabel!
    @IBOutlet weak var serviceAttLabelOutlet: UILabel!
    @IBOutlet weak var serviceErrLabelOutlet: UILabel!
    @IBOutlet weak var AceErrOutlet: UILabel!
    
    @IBOutlet weak var setSegOutlet: UISegmentedControl!
  
    
    @IBOutlet weak var athleteNameTextField: UITextField!
    
    @IBOutlet weak var gameNameTextField: UITextField!
    
    var set : ASet!
    var selectedGame = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        set = selectedGame.sets[0]

    }
    

    @IBAction func setNumAction(_ sender: UISegmentedControl) {
        set = selectedGame.sets[sender.selectedSegmentIndex]
        updateScreen()
    }
    
    
    @IBAction func attackAction(_ sender: UIButton) {
        set.attack += 1
        attackLabelOutlet.text = "\(set.attack)"
    }
    
    @IBAction func killAction(_ sender: UIButton) {
        set.kill += 1
        killLabelOutlet.text = "\(set.kill)"
    }
    
    @IBAction func attackErrAction(_ sender: UIButton) {
        set.attackErr += 1
        AttackErrLabelOutlet.text = "\(set.attackErr)"
    }
    
    
    
    func updateScreen(){
        attackLabelOutlet.text = "\(set.attack)"
        killLabelOutlet.text = "\(set.kill)"
        AttackErrLabelOutlet.text = "\(set.attackErr)"
    }
    

}
