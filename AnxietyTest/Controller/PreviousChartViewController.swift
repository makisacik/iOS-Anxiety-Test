//
//  PreviousChartViewController.swift
//  AnxietyTest
//
//  Created by Mehmet Ali Kısacık on 30.08.2021.
//

import UIKit
import Charts

class PreviousChartViewController: UIViewController {
    
    @IBOutlet weak var previousLabel: UILabel!
    @IBOutlet weak var chartView: UIView!

    private var userResults = [UserResult]()

    override func viewDidLoad() {
        super.viewDidLoad()
        previousLabel.text = "chart_of_previous".localized()
        userResults = CoreDataManager.shared.loadUserResults()
        createChart()
    }

    private func createChart(){
        let barChart = BarChartView(frame: CGRect(x: 0, y: 0, width: chartView.frame.size.width, height: chartView.frame.size.height))
        var entries = [BarChartDataEntry]()
        var x = 1
        for result in userResults{
            entries.append(BarChartDataEntry(x: Double(x), y: Double(result.totalPoint)))
            x = x + 1
        }
        let set = BarChartDataSet(entries: entries, label: "points".localized())
        let data = BarChartData(dataSet: set)
        set.colors = ChartColorTemplates.colorful()
        barChart.data = data
        barChart.drawGridBackgroundEnabled = false
        barChart.pinchZoomEnabled = true
        barChart.doubleTapToZoomEnabled = false
        barChart.highlightPerTapEnabled = false
        barChart.highlightPerDragEnabled = false
        chartView.addSubview(barChart)
    }

}
