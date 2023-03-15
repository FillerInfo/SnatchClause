//
//  GameViewController.swift
//  SnatchClause
//
//  Created by Lee Forbes on 3/14/23.
//

import UIKit

class GameViewController: UIViewController {

	@IBOutlet weak var instructionLabel: UILabel!
	@IBOutlet weak var wordLabel: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()

    }

	@IBAction func onNewWordPressed(_ sender: Any) {
		print("NEXT WORD")
	}
}
