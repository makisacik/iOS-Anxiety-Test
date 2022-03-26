//
//  PreviousChartViewController.swift
//  AnxietyTest
//
//  Created by Mehmet Ali Kısacık on 30.08.2021.
//

import UIKit
import Charts
import CoreData
class PreviousChartViewController: UIViewController {
    
    @IBOutlet weak var previousLabel: UILabel!
    
    @IBOutlet weak var chartView: UIView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext// in order to CRUD
    
    var userResultsArr = [UserResult]()
    override func viewWillAppear(_ animated: Bool) {
        previousLabel.text = "Chart of Previous Results:".localized()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserResults()
        createChart()
        // Do any additional setup after loading the view.
    }
    

    private func createChart(){
        let barChart = BarChartView(frame: CGRect(x: 0, y: 0, width: chartView.frame.size.width, height: chartView.frame.size.height))
        
        var entries = [BarChartDataEntry]()
        var x = 1
        for result in userResultsArr{
            entries.append(BarChartDataEntry(x: Double(x), y: result.totalPoint))
            x = x + 1
        }
        let set = BarChartDataSet(entries: entries, label: "Points".localized())
        let data = BarChartData(dataSet: set)
        set.colors = ChartColorTemplates.colorful()
        barChart.data = data
        barChart.drawGridBackgroundEnabled = false
        barChart.pinchZoomEnabled = false
        barChart.doubleTapToZoomEnabled = false
        barChart.highlightPerTapEnabled = false
        chartView.addSubview(barChart)
        barChart.center = chartView.center
    }
    
    func loadUserResults(){
        let request:NSFetchRequest<UserResult> = UserResult.fetchRequest()
        do{
            userResultsArr = try context.fetch(request)
        }catch{
            print("Error fetching data  \(error)")
        }
    }

}
