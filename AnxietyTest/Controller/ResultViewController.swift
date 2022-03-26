//
//  ResultViewController.swift
//  AnxietyTest
//
//  Created by Mehmet Ali Kısacık on 30.08.2021.
//

import UIKit
import CoreData
class ResultViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var tableLabel: UILabel!
    
    @IBOutlet weak var mainMenuButton: UIButton!
    
    @IBOutlet weak var previousTestButton: UIButton!
    
    var result : Int?
    
    var table = "Interpreting the results:\n0 to 4 = Mild anxiety\n5 to 9 = Moderate anxiety\n10 to 14 = Moderately severe anxiety\n15 to 21 = Severe anxiety\n".localized()
    
    override func viewWillAppear(_ animated: Bool) {
        mainMenuButton.layer.cornerRadius = 30
        previousTestButton.layer.cornerRadius = 30
        mainMenuButton.setTitle("Main Menu".localized(), for: .normal)
        previousTestButton.setTitle("My Previous Tests".localized(), for: .normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(urls)
        
        if let r = result{
            resultLabel.text = "Total score : ".localized() + " \(r)"
        }
        tableLabel.text = table
        
        let newResult = UserResult(context: context)
        newResult.date = Date()
        newResult.totalPoint = Double(result!)
        saveResult()
    }
    
    func saveResult(){
        do {
            try context.save()
        } catch{
            print("Error on saving data \(error)")
        }
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
