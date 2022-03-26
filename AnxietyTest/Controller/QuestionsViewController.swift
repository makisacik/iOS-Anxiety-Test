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
    override func viewWillAppear(_ animated: Bool) {
        nextButton.layer.cornerRadius = 30
        backButton.layer.cornerRadius = 30
        firstChoiceLabel.text = "Not at all".localized()
        secondChoiceLabel.text = "Several days".localized()
        thirdChoiceLabel.text = "More than half of the days".localized()
        forthChoiceLabel.text = "Nearly every day".localized()
        nextButton.setTitle("Next".localized(), for: .normal)
        backButton.setTitle("Back".localized(), for: .normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
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
        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchPressed(_ sender: UISwitch) {
        let choiceIndex = switchesArr.firstIndex(of: sender)
        for i in 0...3{
            if i == choiceIndex{
                switchesArr[i].setOn(true, animated: true)
                pointsArr[Questions.currentQuestion] = i //sets the point to pointsArr
            }else{
                switchesArr[i].setOn(false, animated: true)
            }
        }
    }
    
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        let real = sender.backgroundColor!
        UIView.animate(withDuration: 0.5){
            sender.backgroundColor = sender.tintColor
            sender.backgroundColor = real
            print(Questions.arr.count)
        }
        if Questions.currentQuestion < Questions.arr.count-1{
            print(Questions.currentQuestion)
            Questions.currentQuestion += 1
            questionLabel.text = Questions.arr[Questions.currentQuestion]
            clearChoices()
        }
        // if the tests ends
        else if Questions.currentQuestion == Questions.arr.count-1 {
            print(Questions.currentQuestion)
            performSegue(withIdentifier: "resultsSegue", sender: self)
        }
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        let real = sender.backgroundColor!
        UIView.animate(withDuration: 0.5){
            sender.backgroundColor = sender.tintColor
            sender.backgroundColor = real
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segue.identifier
        let destinationVc = segue.destination as! ResultViewController
        var result = 0
        for point in pointsArr{
            result += point
        }
        destinationVc.result = result
    }

}
