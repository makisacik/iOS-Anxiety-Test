//
//  DisclaimerViewController.swift
//  AnxietyTest
//
//  Created by Mehmet Ali Kısacık on 30.08.2021.
//

import UIKit

class DisclaimerViewController: UIViewController {

    @IBOutlet weak var disclaimerLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        disclaimerLabel.text = "disclaimer".localized()
    }
}
