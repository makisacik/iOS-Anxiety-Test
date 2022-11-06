//
//  MenuViewController.swift
//  AnxietyTest
//
//  Created by Mehmet Ali Kısacık on 30.08.2021.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var takeTestButton: UIButton!
    @IBOutlet weak var previousTestsButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var disclaimerButton: UIButton!

    private var mainTitleIsSet: Bool = false

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !mainTitleIsSet {
            setMainTitleLabel()
            mainTitleIsSet = true
        }
    }

    private func setup() {
        takeTestButton.setTitle("take_test".localized(), for: .normal)
        previousTestsButton.setTitle("previous_tests".localized(), for: .normal)
        aboutButton.setTitle("about_test".localized(), for: .normal)
        disclaimerButton.setTitle("disclaimer_and_copyright".localized(), for: .normal)
        takeTestButton.layer.cornerRadius = 25
        previousTestsButton.layer.cornerRadius = 25
        aboutButton.layer.cornerRadius = 25
        disclaimerButton.layer.cornerRadius = 25
    }

    private func setMainTitleLabel() {
        let mainTitle = "anxiety_test".localized()
        var charIndex = 0
        for letter in mainTitle{
            Timer.scheduledTimer(withTimeInterval: 0.10 * Double(charIndex), repeats: false) { (timer) in
                self.mainTitle.text?.append(letter)
            }
            charIndex += 1
        }
    }

}
