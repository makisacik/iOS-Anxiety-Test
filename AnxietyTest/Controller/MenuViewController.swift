//
//  MenuViewController.swift
//  AnxietyTest
//
//  Created by Mehmet Ali Kısacık on 30.08.2021.
//

import UIKit
import CoreData
class MenuViewController: UIViewController {

    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var takeTestButton: UIButton!
    @IBOutlet weak var previousTestsButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var disclaimerButton: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        mainTitle.textAlignment = .center
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        
        
        takeTestButton.setTitle("Take Test".localized(), for: .normal)
        previousTestsButton.setTitle("Previous Tests".localized(), for: .normal)
        aboutButton.setTitle("About the Tests".localized(), for: .normal)
        disclaimerButton.setTitle("Disclaimer and Copyright".localized(), for: .normal)
        takeTestButton.layer.cornerRadius = 25
        previousTestsButton.layer.cornerRadius = 25
        aboutButton.layer.cornerRadius = 25
        disclaimerButton.layer.cornerRadius = 25
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mainTitle = "Anxiety Test".localized()
        var charIndex = 0.0
        for letter in mainTitle{
            Timer.scheduledTimer(withTimeInterval: 0.10*charIndex, repeats: false) { (timer) in
                self.mainTitle.text?.append(letter)
            }
            charIndex += 1
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
