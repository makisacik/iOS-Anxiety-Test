//
//  HowToViewController.swift
//  AnxietyTest
//
//  Created by Mehmet Ali Kısacık on 30.08.2021.
//

import UIKit

class HowToViewController: UIViewController {

    @IBOutlet weak var howToLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var gotItButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gotItButton.setTitle("Got It".localized(), for: .normal)
        infoLabel.text = "Put a check to indicate how much you have experienced each symptom during the last two weeks".localized()
        howToLabel.text = "How to take the test ?".localized()
    }
    
    @IBAction func gotItButtonPressed(_ sender: UIButton) {
        Questions.currentQuestion = 0
        let real = sender.backgroundColor
        UIView.animate(withDuration: 0.5){
            sender.backgroundColor = sender.tintColor
            sender.backgroundColor = real
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
