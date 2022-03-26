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
        disclaimerLabel.text = "Disclaimer: This app is for information only and should not be used for the diagnosis or treatment of medical conditions. Creator of this app  has used all reasonable care in compiling the information but make no warranty as to its accuracy. accuracy. Consult a doctor or other health care professional for diagnosis and treatment of medical conditions \n\n Copyright: The GAD-7 originates from Spitzer RL, Kroenke K, Williams JB, et al; A brief measure for assessing generalized anxiety disorder: the GAD-7. Arch Intern Med. 2006 May 22;166(10):1092-7. GAD-7 © Pfizer Inc. all rights reserved.".localized()
        // Do any additional setup after loading the view.
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
