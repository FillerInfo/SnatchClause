//
//  ViewController.swift
//  SnatchClause
//
//  Created by Lee Forbes on 3/14/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
	
	let categories = ["The Great Outdoors",
					  "Sports",
					  "Movies and Television",
					  "Household Objects",
					  "Food",
					  "Academics",
					  "Life",
					  "Cars",
					  "Famous People",
					  "Beverages"
	]

	@IBOutlet weak var team1Slider: UISlider!
	@IBOutlet weak var team2Slider: UISlider!
	
	@IBOutlet weak var categoryPicker: UIPickerView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		categoryPicker.dataSource = self
		categoryPicker.delegate = self
	}
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return categories.count
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return categories[row]
	}

	@IBAction func onTeam1ValueChanged(_ sender: Any) {
		team1Slider.setValue(round(team1Slider.value), animated: true)
	}
	
	@IBAction func onTeam1AddPointButtonPressed(_ sender: Any) {
		team1Slider.setValue(team1Slider.value + 1, animated: true)
	}
	
	@IBAction func onTeam2ValueChanged(_ sender: Any) {
		team2Slider.setValue(round(team2Slider.value), animated: true)
	}
	
	@IBAction func onTeam2AddPointButtonPressed(_ sender: Any) {
		team2Slider.setValue(team2Slider.value + 1, animated: true)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "MenuToGameSegue",
		  let nextVC = segue.destination as? GameViewController
	   {
			nextVC.wordList = ["do this here", "a", "b", "c"]
	   }
	}
	
	@IBAction func playButtonPressed(_ sender: Any) {
		performSegue(withIdentifier: "MenuToGameSegue", sender: self)
	}
}

