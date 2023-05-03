//
//  GameViewController.swift
//  SnatchClause
//
//  Created by Lee Forbes on 3/14/23.
//

import UIKit

class GameViewController: UIViewController {
	
	var wordList: [String] = ["WORDS NOT SET!!"]

	@IBOutlet weak var backgroundView: UIView!
	@IBOutlet weak var instructionLabel: UILabel!
	@IBOutlet weak var wordLabel: UILabel!
	@IBOutlet weak var actionButton: UIButton!
	
	var wordTime: Int = 15
	var roundTime: Int = 90
	var instructionTime: Int = 0
	
	let gameTimer = DispatchQueue(label: "gameTimer", qos: .background)
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		backgroundView.backgroundColor = .white
		instructionLabel.isHidden = true
		wordLabel.text = wordList.randomElement()
		actionButton.setTitle("Next Word", for: .normal)
		
		wordTime = 15
		roundTime = 5
		instructionTime = 0
		
		gameTimer.async {
			while self.roundTime > 0 {
				sleep(1)
				
				self.wordTime -= 1
				self.roundTime -= 1
				self.instructionTime -= 1
				print("\nword: ", self.wordTime)
				print("round: ", self.roundTime)
				print("ins: ", self.instructionTime)
				
				if self.wordTime <= 0 {
					DispatchQueue.main.async {
						self.wordLabel.text = self.wordList.randomElement()
						
						self.wordTime = 15
						
						self.instructionTime = 3
						self.instructionLabel.text = "Pass!"
						self.instructionLabel.isHidden = false
						
						// play beep here!
						print("TIME UP NEXT WORD")
					}
				}
				
				if self.instructionTime <= 0 {
					DispatchQueue.main.async {
						self.instructionLabel.isHidden = true
					}
				}
			}
			
			// explode here!! play sound, show instruction
			print("GAME OVER!!")
			DispatchQueue.main.async {
				self.backgroundView.backgroundColor = .orange
				self.instructionLabel.text = "BOOM"
				self.instructionLabel.isHidden = false
				self.actionButton.setTitle("Back", for: .normal)
			}
		}
    }

	@IBAction func onNewWordPressed(_ sender: Any) {
		if roundTime > 0 {
			wordLabel.text = wordList.randomElement()
			wordTime = 15
		} else {
			self.dismiss(animated: true)
		}
	}
}
