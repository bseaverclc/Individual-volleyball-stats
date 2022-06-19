//
//  StatsEntryViewController.swift
//  Individual volleyball stats
//
//  Created by Brian Seaver on 6/17/22.
//

import UIKit

class StatsEntryViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var nameAthleteOutlet: UITextField!
    @IBOutlet weak var nameGameOutlet: UITextField!
    
    @IBOutlet weak var nameScoreOutlet: UITextField!
    @IBOutlet weak var opponentScoreOutlet: UITextField!
    
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
    
    @IBOutlet weak var aceOutlet: UILabel!
    @IBOutlet weak var setSegOutlet: UISegmentedControl!
  
    @IBOutlet weak var hitPctLabel: UILabel!
    @IBOutlet weak var SReceivePctLabel: UILabel!
    
    
    @IBOutlet weak var zeroLabel: UILabel!
    @IBOutlet weak var oneLabel: UILabel!
    @IBOutlet weak var twoLabel: UILabel!
    @IBOutlet weak var threeLabel: UILabel!
    
    var set : ASet!
    var selectedGame = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        set = selectedGame.sets[0]
        nameGameOutlet.delegate = self
        nameAthleteOutlet.delegate = self
        nameScoreOutlet.delegate = self
        opponentScoreOutlet.delegate = self
        updateScreen()

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(AppData.games) {
                           UserDefaults.standard.set(encoded, forKey: "games")
                       }
    }
    

    @IBAction func setNumAction(_ sender: UISegmentedControl) {
        set = selectedGame.sets[sender.selectedSegmentIndex]
        updateScreen()
    }
    
    
    @IBAction func attackAction(_ sender: UIButton) {
        set.attack += 1
        attackLabelOutlet.text = "\(set.attack)"
        highlightPurpleButton(button: sender)
        updateScreen()
    }
    
    @IBAction func attackSwipeAction(_ sender: UISwipeGestureRecognizer) {
        set.attack -= 1
        attackLabelOutlet.text = "\(set.attack)"
        updateScreen()
    }
    @IBAction func killAction(_ sender: UIButton) {
        set.kill += 1
        set.attack += 1
        killLabelOutlet.text = "\(set.kill)"
        attackLabelOutlet.text = "\(set.attack)"
        highlightPurpleButton(button: sender)
        updateScreen()
    }
    
    @IBAction func killSwipeAction(_ sender: UISwipeGestureRecognizer) {
        set.kill -= 1
        updateScreen()
    }
    @IBAction func attackErrAction(_ sender: UIButton) {
        set.attackErr += 1
        set.attack += 1
        AttackErrLabelOutlet.text = "\(set.attackErr)"
        attackLabelOutlet.text = "\(set.attack)"
        highlightPurpleButton(button: sender)
        updateScreen()
    }
    
    @IBAction func attackErrSwipeAction(_ sender: UISwipeGestureRecognizer) {
        set.attackErr -= 1
        updateScreen()
    }
    
    
    @IBAction func AssistAttAction(_ sender: UIButton) {
        set.assistAtt += 1
        AssistAttLabelOutlet.text = "\(set.assistAtt)"
        highlightTealButton(button: sender)
        updateScreen()
    }
    @IBAction func assistAttSwipeAction(_ sender: UISwipeGestureRecognizer) {
        set.assistAtt -= 1
        updateScreen()
    }
    
    @IBAction func assistAction(_ sender: UIButton) {
        set.assist += 1
        AssistLabelOutlet.text = "\(set.assist)"
        set.assistAtt += 1
        AssistAttLabelOutlet.text = "\(set.assistAtt)"
        highlightTealButton(button: sender)
        updateScreen()
    }
    
   
    @IBAction func assistSwipeAction(_ sender: UISwipeGestureRecognizer) {
        set.assist -= 1
        updateScreen()
    }
    
    @IBAction func ballHandErrAction(_ sender: UIButton) {
        set.ballHandErr += 1
        BallHandErrLabelOutlet.text = "\(set.ballHandErr)"
        set.assistAtt += 1
        AssistAttLabelOutlet.text = "\(set.assistAtt)"
        highlightTealButton(button: sender)
        updateScreen()
    }
    
    @IBAction func ballHandErrSwipeAction(_ sender: UISwipeGestureRecognizer) {
        set.ballHandErr -= 1
        updateScreen()
    }
    @IBAction func soloBlockAction(_ sender: UIButton) {
        set.soloBlock += 1
        soloBlockLabelOutlet.text = "\(set.soloBlock)"
        highlightIndigoButton(button: sender)
        updateScreen()
    }
    
    @IBAction func soloBlockSwipeAction(_ sender: UISwipeGestureRecognizer) {
        set.soloBlock -= 1
      
        updateScreen()
    }
    @IBAction func blockAssistAction(_ sender: UIButton) {
        set.blockAsst += 1
        blockAsstLabelOutlet.text = "\(set.blockAsst)"
        highlightIndigoButton(button: sender)
        updateScreen()
    }
    
    @IBAction func blockAsstSwipeAction(_ sender: UISwipeGestureRecognizer) {
        set.blockAsst -= 1
        updateScreen()
    }
    @IBAction func digAction(_ sender: UIButton) {
        set.dig += 1
        digLabelOutlet.text = "\(set.dig)"
        highlightOrangeButton(button: sender)
        updateScreen()
    }
    
    @IBAction func digSwipeAction(_ sender: UISwipeGestureRecognizer) {
        set.dig -= 1
        updateScreen()
    }
    @IBAction func serveAttAction(_ sender: UIButton) {
        set.serveAtt += 1
        serviceAttLabelOutlet.text = "\(set.serveAtt)"
        highlightPinkButton(button: sender)
        updateScreen()
    }
    @IBAction func serveAttSwipeAction(_ sender: UISwipeGestureRecognizer) {
        set.serveAtt -= 1
        updateScreen()
    }
    
    @IBAction func serviceErrAction(_ sender: UIButton) {
        set.serveErr += 1
        set.serveAtt += 1
        serviceErrLabelOutlet.text = "\(set.serveErr)"
        highlightPinkButton(button: sender)
        updateScreen()
    }
    
    @IBAction func serveErrSwipeAction(_ sender: UISwipeGestureRecognizer) {
        set.serveErr -= 1
        updateScreen()
    }
    
    @IBAction func aceAction(_ sender: UIButton) {
        set.ace += 1
        set.serveAtt += 1
        aceOutlet.text = "\(set.ace)"
        highlightPinkButton(button: sender)
        updateScreen()
    }
    
    @IBAction func aceSwipeAction(_ sender: UISwipeGestureRecognizer) {
        set.ace -= 1
        updateScreen()
    }
    
    
    func updateScreen(){
        nameGameOutlet.text = selectedGame.gameName
        nameAthleteOutlet.text = selectedGame.athleteName
        if let ns = set.nameScore, let os = set.opponentScore{
            print("showing scores")
            nameScoreOutlet.text = "\(ns)"
            opponentScoreOutlet.text = "\(os)"
        }
        else{
            nameScoreOutlet.text = ""
            opponentScoreOutlet.text = ""
        }
        
        if set.attack != 0{
            var hitPercentage = (Double(set.kill - set.attackErr))/Double(set.attack)
            var hitPercentString = String(format: "%.3f", hitPercentage)
            hitPctLabel.text = "Hitting% \(hitPercentString)"
        }
        else{
            hitPctLabel.text = "Hitting% .000"
        }
        
        attackLabelOutlet.text = "\(set.attack)"
        killLabelOutlet.text = "\(set.kill)"
        AttackErrLabelOutlet.text = "\(set.attackErr)"
        AssistAttLabelOutlet.text = "\(set.assistAtt)"
        AssistLabelOutlet.text = "\(set.assist)"
        BallHandErrLabelOutlet.text = "\(set.ballHandErr)"
        soloBlockLabelOutlet.text = "\(set.soloBlock)"
        blockAsstLabelOutlet.text = "\(set.blockAsst)"
        digLabelOutlet.text = "\(set.dig)"
        serviceAttLabelOutlet.text = "\(set.serveAtt)"
        serviceErrLabelOutlet.text = "\(set.serveErr)"
        aceOutlet.text = "\(set.ace)"
        
        zeroLabel.text = "\(set.zero)"
        oneLabel.text = "\(set.one)"
        twoLabel.text = "\(set.two)"
        threeLabel.text = "\(set.three)"
        
        var totalServes = set.one + set.two + set.three + set.zero
        if totalServes != 0{
            var total = Double(set.one + 2 * set.two + 3 * set.three)
            var avg = total / Double(totalServes)
            var avgString = String(format: "%.2f", avg)
            SReceivePctLabel.text = "S.Receive \(avgString)"
        }
        else{
            SReceivePctLabel.text = "S.Receive 0.00"
        }
        
    }
        
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        selectedGame.athleteName = nameAthleteOutlet.text!
        selectedGame.gameName = nameGameOutlet.text!
        if nameScoreOutlet.text != ""{
            var nameScoreTrimmed = nameScoreOutlet.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if let ns = Int(nameScoreTrimmed){
            print("namescore saved")
            set.nameScore = ns
        }
        }
        if opponentScoreOutlet.text != ""{
            var nameScoreTrimmed = opponentScoreOutlet.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if let os = Int(nameScoreTrimmed){
            set.opponentScore = os
        }
        }
        
        nameGameOutlet.resignFirstResponder()
        nameAthleteOutlet.resignFirstResponder()
        nameScoreOutlet.resignFirstResponder()
        opponentScoreOutlet.resignFirstResponder()
        return true
    }
    
    @IBAction func zeroAction(_ sender: UIButton) {
        set.zero += 1
        highlightYellowButton(button: sender)
        updateScreen()
    }
    
    @IBAction func zeroSwipeAction(_ sender: UISwipeGestureRecognizer) {
        set.zero -= 1
        updateScreen()
    }
    @IBAction func oneAction(_ sender: UIButton) {
        set.one += 1
        highlightYellowButton(button: sender)
        updateScreen()
    }
    
    @IBAction func oneSwipeAction(_ sender: UISwipeGestureRecognizer) {
        set.one -= 1
        updateScreen()
    }
    @IBAction func twoAction(_ sender: UIButton) {
        set.two += 1
        highlightYellowButton(button: sender)
        updateScreen()
    }
    @IBAction func twoSwipe(_ sender: UISwipeGestureRecognizer) {
        set.two -= 1
       
        updateScreen()
    }
    
    @IBAction func threeAction(_ sender: UIButton) {
        set.three += 1
        highlightYellowButton(button: sender)
        updateScreen()
    }
    
    @IBAction func threeSwipeAction(_ sender: UISwipeGestureRecognizer) {
        set.three -= 1
        updateScreen()
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(AppData.games) {
                           UserDefaults.standard.set(encoded, forKey: "games")
           var errorTitle = "Success!"
            var errorMessage = "Game has been saved"
            let alert = UIAlertController(title: "Success!", message: "Game has been saved", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
                       }
    }
    
    
    
    @IBAction func fullGameStatsAction(_ sender: UIButton) {
        performSegue(withIdentifier: "toFullStats", sender:     self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! FullStatsViewController
        nvc.selectedGame = selectedGame
    }
    
    func highlightPurpleButton(button: UIButton){
        print("calling highlightRedbutton")
       // var ogc = button.backgroundColor
        button.backgroundColor = UIColor.green
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
            button.backgroundColor = UIColor.systemPurple
            print("changing back to red color")
        }
    }
    
    func highlightTealButton(button: UIButton){
        print("calling highlightRedbutton")
       // var ogc = button.backgroundColor
        button.backgroundColor = UIColor.green
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
            button.backgroundColor = UIColor.systemTeal
            print("changing back to red color")
        }
    }
    
    func highlightIndigoButton(button: UIButton){
        print("calling highlightRedbutton")
       // var ogc = button.backgroundColor
        button.backgroundColor = UIColor.green
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
            button.backgroundColor = UIColor.systemIndigo
            print("changing back to red color")
        }
    }
    
    func highlightOrangeButton(button: UIButton){
        print("calling highlightRedbutton")
       // var ogc = button.backgroundColor
        button.backgroundColor = UIColor.green
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
            button.backgroundColor = UIColor.systemOrange
            print("changing back to red color")
        }
    }
    
    func highlightPinkButton(button: UIButton){
        print("calling highlightRedbutton")
       // var ogc = button.backgroundColor
        button.backgroundColor = UIColor.green
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
            button.backgroundColor = UIColor.systemPink
            print("changing back to red color")
        }
    }
    
    func highlightYellowButton(button: UIButton){
        print("calling highlightRedbutton")
       // var ogc = button.backgroundColor
        button.backgroundColor = UIColor.green
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
            button.backgroundColor = UIColor.systemYellow
            print("changing back to red color")
        }
    }
    
    
}
