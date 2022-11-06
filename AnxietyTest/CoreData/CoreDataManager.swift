//
//  File.swift
//  AnxietyTest
//
//  Created by Mehmet Ali Kısacık on 2.11.2022.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {

    static let shared = CoreDataManager()

    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func createResult(totalPoints: Int){
        let result = UserResult(context: context)
        result.date = Date()
        result.totalPoint = Int16(totalPoints)
        saveResult()
    }

    func saveResult(){
        do {
            try context.save()
        } catch {
            print("Error on saving data \(error)")
        }
    }

    func loadUserResults() -> [UserResult]{
        let request:NSFetchRequest<UserResult> = UserResult.fetchRequest()
        do {
            let results = try context.fetch(request)
            return results
        } catch {
            print("Error fetching data  \(error)")
            return [UserResult]()
        }
    }

}
