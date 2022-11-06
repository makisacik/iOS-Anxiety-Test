//
//  ResultViewController.swift
//  AnxietyTest
//
//  Created by Mehmet Ali Kısacık on 30.08.2021.
//

import UIKit
import CoreData

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var tableLabel: UILabel!
    @IBOutlet weak var mainMenuButton: UIButton!
    @IBOutlet weak var previousTestButton: UIButton!
    
    var totalPoint: Int = 0
    
    var text = "interpreting_results".localized()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        mainMenuButton.layer.cornerRadius = 30
        previousTestButton.layer.cornerRadius = 30
        mainMenuButton.setTitle("main_menu".localized(), for: .normal)
        previousTestButton.setTitle("previous_tests".localized(), for: .normal)
        resultLabel.text = "total_score".localized() + "\(totalPoint)"

        tableLabel.text = text
        CoreDataManager.shared.createResult(totalPoints: totalPoint)
    }
    
}
