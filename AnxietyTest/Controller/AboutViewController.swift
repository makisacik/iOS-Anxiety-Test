//
//  AboutViewController.swift
//  AnxietyTest
//
//  Created by Mehmet Ali Kısacık on 30.08.2021.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var aboutLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutLabel.text = "This questionnaire called the GAD-7 screening tool can help you find out if you might have an anxiety disorder that needs treatment. It calculates how many common symptoms you have and based on your answers suggests where you might be on a scale, from mild to severe anxiety. The results of this test is not a substitute for a medical treatment , if you have medical problems we strongly insist you to consult a professional.".localized()
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
