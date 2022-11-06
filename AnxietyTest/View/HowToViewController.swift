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
        setup()
    }

    private func setup(){
        gotItButton.setTitle("got_it".localized(), for: .normal)
        infoLabel.text = "how_to_info".localized()
        howToLabel.text = "how_to_take".localized()
        gotItButton.layer.cornerRadius = 25
    }

    @IBAction func gotItButtonPressed(_ sender: UIButton) {
        Questions.currentQuestion = 0
        let color = sender.backgroundColor ?? .blue

        UIView.animate(withDuration: 0.5){
            sender.backgroundColor = sender.tintColor
            sender.backgroundColor = color
        }

        guard let questionsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: String(describing: QuestionsViewController.self)) as? QuestionsViewController else { return }
        questionsViewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(questionsViewController, animated: true)
    }
}
