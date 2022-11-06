//
//  QuestionsViewController.swift
//  AnxietyTest
//
//  Created by Mehmet Ali Kısacık on 30.08.2021.
//

import UIKit

class QuestionsViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstChoice: UISwitch!
    @IBOutlet weak var firstChoiceLabel: UILabel!
    @IBOutlet weak var secondChoice: UISwitch!
    @IBOutlet weak var secondChoiceLabel: UILabel!
    @IBOutlet weak var thirdChoice: UISwitch!
    @IBOutlet weak var thirdChoiceLabel: UILabel!
    @IBOutlet weak var forthChoice: UISwitch!
    @IBOutlet weak var forthChoiceLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var switchesArr : [UISwitch] = []
    var pointsArr : [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup(){
        nextButton.layer.cornerRadius = 30
        backButton.layer.cornerRadius = 30
        firstChoiceLabel.text = "first_option".localized()
        secondChoiceLabel.text = "second_option".localized()
        thirdChoiceLabel.text = "third_option".localized()
        forthChoiceLabel.text = "fourth_option".localized()
        nextButton.setTitle("next".localized(), for: .normal)
        backButton.setTitle("back".localized(), for: .normal)

        for _ in 0...Questions.arr.count-1{
            pointsArr.append(0)
        }

        switchesArr.append(firstChoice)
        switchesArr.append(secondChoice)
        switchesArr.append(thirdChoice)
        switchesArr.append(forthChoice)

        for choice in switchesArr{
            choice.isOn = false
        }

        questionLabel.text = Questions.arr[Questions.currentQuestion]
    }

    @IBAction func switchPressed(_ sender: UISwitch) {
        let choiceIndex = switchesArr.firstIndex(of: sender)
        for i in 0...3{
            if i == choiceIndex{
                switchesArr[i].setOn(true, animated: true)
                pointsArr[Questions.currentQuestion] = i //sets the point to pointsArr
            } else {
                switchesArr[i].setOn(false, animated: true)
            }
        }
    }
    
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        let color = sender.backgroundColor ?? .blue
        UIView.animate(withDuration: 0.5){
            sender.backgroundColor = sender.tintColor
            sender.backgroundColor = color
        }

        if Questions.currentQuestion < Questions.arr.count-1 {
            Questions.currentQuestion += 1
            questionLabel.text = Questions.arr[Questions.currentQuestion]
            clearChoices()
        } else if Questions.currentQuestion == Questions.arr.count - 1 {
            var totalPoint = 0
            for point in pointsArr {
                totalPoint += point
            }
            guard let resultViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: String(describing: ResultViewController.self)) as? ResultViewController else { return }
            resultViewController.totalPoint = totalPoint
            resultViewController.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(resultViewController, animated: true)
        }
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        let color = sender.backgroundColor ?? .blue
        UIView.animate(withDuration: 0.5){
            sender.backgroundColor = sender.tintColor
            sender.backgroundColor = color
        }

        if Questions.currentQuestion > 0{
            Questions.currentQuestion -= 1
            questionLabel.text = Questions.arr[Questions.currentQuestion]
            clearChoices()
        }
    }
    
    func clearChoices(){
        for choice in switchesArr {
            choice.setOn(false, animated: true)
        }
    }

}
