//
//  PreviousButtonsViewController.swift
//  AnxietyTest
//
//  Created by Mehmet Ali Kısacık on 30.08.2021.
//

import UIKit

class PreviousButtonsViewController: UIViewController {

    @IBOutlet weak var listLabel: UILabel!
    @IBOutlet weak var chartLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listLabel.text = "as_table".localized()
        chartLabel.text = "as_chart".localized()
    }

}
