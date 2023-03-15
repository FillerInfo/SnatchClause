//
//  GameViewController.swift
//  SnatchClause
//
//  Created by Lee Forbes on 3/14/23.
//

import UIKit

class GameViewController: UIViewController {
	
	var wordList: [String] = ["WORDS NOT SET!!"]

	@IBOutlet weak var instructionLabel: UILabel!
	@IBOutlet weak var wordLabel: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		instructionLabel.isHidden = true
		
		wordLabel.text = wordList.randomElement()
    }

	@IBAction func onNewWordPressed(_ sender: Any) {
		print("NEXT WORD")
	}
}
