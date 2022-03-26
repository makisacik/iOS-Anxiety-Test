//
//  PreviousListTableViewController.swift
//  AnxietyTest
//
//  Created by Mehmet Ali Kısacık on 30.08.2021.
//

import UIKit
import CoreData
class PreviousListTableViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext// in order to CRUD
    var userResultsArr = [UserResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserResults()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userResultsArr.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath)
        
        let currentDateTime = userResultsArr[indexPath.row].date

        let userCalendar = Calendar.current

        let requestedComponents: Set<Calendar.Component> = [
            .year,
            .month,
            .day,
            .hour,
        ]
        
        let dateTimeComponents = userCalendar.dateComponents(requestedComponents, from: currentDateTime!)
        
        let cellText = "Total score : ".localized() + "\(Int(userResultsArr[indexPath.row].totalPoint)) "+"Date : ".localized() + "\(dateTimeComponents.day!)/\(dateTimeComponents.month!)/\(dateTimeComponents.year!)"
        
        cell.textLabel?.text = cellText
        return cell
    }
    
    
    func loadUserResults(){
        let request:NSFetchRequest<UserResult> = UserResult.fetchRequest()
        do{
            userResultsArr = try context.fetch(request)
        }catch{
            print("Error fetching data  \(error)")
        }
        tableView.reloadData()
    }
}
