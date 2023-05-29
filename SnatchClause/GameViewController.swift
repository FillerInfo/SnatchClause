//
//  GameViewController.swift
//  SnatchClause
//
//  Created by Lee Forbes on 3/14/23.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {
	
	var wordList: [String] = ["WORDS NOT SET!!"]

	@IBOutlet weak var backgroundView: UIView!
	@IBOutlet weak var instructionLabel: UILabel!
	@IBOutlet weak var wordLabel: UILabel!
	@IBOutlet weak var actionButton: UIButton!
	
	let THE_WORD_TIME = 15
	let THE_ROUND_TIME = 90
	let THE_INSTRUCTION_TIME = 3
	
	var wordTime: Int = 15
	var roundTime: Int = 90
	var instructionTime: Int = 0
	
	let gameTimer = DispatchQueue(label: "gameTimer", qos: .background)
	var player: AVAudioPlayer?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		backgroundView.backgroundColor = .white
		instructionLabel.isHidden = true
		wordLabel.text = wordList.randomElement()?.uppercased()
		actionButton.setTitle("Next Word", for: .normal)
		
		wordTime = THE_WORD_TIME
		roundTime = THE_ROUND_TIME
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
						self.wordLabel.text = self.wordList.randomElement()?.uppercased()
						self.wordTime = self.THE_WORD_TIME
						
						self.instructionTime = self.THE_INSTRUCTION_TIME
						self.instructionLabel.text = "Pass!"
						self.instructionLabel.isHidden = false
						
						self.playSound(sound: "newword", ext: "mp3")
						print("TIME UP NEXT WORD")
					}
				}
				
				if self.instructionTime <= 0 {
					DispatchQueue.main.async {
						self.instructionLabel.isHidden = true
					}
				}
			}
			
			self.playSound(sound: "boom", ext: "mp3")
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
			wordLabel.text = wordList.randomElement()?.uppercased()
			wordTime = THE_WORD_TIME
		} else {
			self.dismiss(animated: true)
		}
	}

	func playSound(sound: String, ext: String) {
		guard let url = Bundle.main.url(forResource: sound, withExtension: ext) else { return }

		do {
			try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
			try AVAudioSession.sharedInstance().setActive(true)

			/* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
			player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

			/* iOS 10 and earlier require the following line:
			player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

			guard let player = player else { return }

			player.play()

		} catch let error {
			print("sound error", error.localizedDescription)
		}
	}
}
