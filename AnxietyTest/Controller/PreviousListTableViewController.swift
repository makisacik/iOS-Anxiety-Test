//
//  PreviousListTableViewController.swift
//  AnxietyTest
//
//  Created by Mehmet Ali Kısacık on 30.08.2021.
//

import UIKit

class PreviousListTableViewController: UITableViewController {

    private var userResults = [UserResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userResults = CoreDataManager.shared.loadUserResults()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userResults.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath)
        
        let currentDateTime = userResults[indexPath.row].date
        let userCalendar = Calendar.current
        let requestedComponents: Set<Calendar.Component> = [
            .year,
            .month,
            .day,
            .hour,
        ]
        let dateTimeComponents = userCalendar.dateComponents(requestedComponents, from: currentDateTime!)
        
        let cellText = "total_score".localized() + "\(Int(userResults[indexPath.row].totalPoint)) "+"date".localized() + "\(dateTimeComponents.day!)/\(dateTimeComponents.month!)/\(dateTimeComponents.year!)"
        cell.textLabel?.text = cellText

        return cell
    }
}
