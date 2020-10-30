//
//  ModalViewController.swift
//  modalsample
//
//  Created by 舘佳紀 on 2020/10/27.
//
 
import UIKit
import Charts

class ModalViewController: UIViewController, ChartViewDelegate {

    
    @IBOutlet weak var chartView: RadarChartView!
    
    var shouldHideData: Bool = false
    let activities = ["Burger", "Steak", "Salad", "Pasta", "Pizza"]
    let originalBarBgColor : UIColor! = nil
    let originalTintColor :UIColor! = nil
    let originalBarStyle : UIColor! = nil
    
    override func viewDidLoad() {
        view.backgroundColor = .black
        super.viewDidLoad()
        chartView.delegate = self
        
        chartView.chartDescription?.enabled = false
        chartView.webLineWidth = 1
        chartView.innerWebLineWidth = 1
        chartView.webColor = .lightGray
        chartView.innerWebColor = .yellow
        chartView.webAlpha = 1
        
        let xAxis = chartView.xAxis
        xAxis.labelFont = .systemFont(ofSize: 9, weight: .light)
        xAxis.xOffset = 0
        xAxis.yOffset = 0
        xAxis.valueFormatter = self
        xAxis.labelTextColor = .white
        
        
        let yAxis = chartView.yAxis
        yAxis.labelFont = .systemFont(ofSize: 9, weight: .light)
        yAxis.labelCount = 5
        yAxis.axisMinimum = 0
        yAxis.axisMaximum = 80
        yAxis.drawLabelsEnabled = false
        
        let legend = chartView.legend
        legend.horizontalAlignment = .center
        legend.verticalAlignment = .top
        legend.orientation = .horizontal
        legend.drawInside = false
        legend.font = .systemFont(ofSize: 10, weight: .light)
        legend.xEntrySpace = 7
        legend.yEntrySpace = 5
        legend.textColor = .white
        
        self.updateChartData()
        
        chartView.animate(xAxisDuration: 1.4, yAxisDuration: 1.4, easingOption: .easeOutBack)

    }
    
    func updateChartData() {
        if self.shouldHideData {
            chartView.data = nil
            return
        }
        
        self.setCharData()
    }
    
    func setCharData() {
        let mult : UInt32 = 80
        let min : UInt32 = 20
        let count = 5
        
        let block: (Int) -> RadarChartDataEntry = { _ in return RadarChartDataEntry(value: Double(arc4random_uniform(mult) + min))
        }
        
        
        let entries1 = (0..<count).map(block)
        let entries2 = (0..<count).map(block)
        
        let set1 = RadarChartDataSet(entries: entries1, label: "Last Week")
        set1.setColor(UIColor(red: 103/255, green: 110/255, blue: 129/255, alpha: 1))
        set1.fillColor = UIColor(red: 103/255, green: 110/255, blue: 129/255, alpha: 1)
        set1.drawFilledEnabled = true
        set1.fillAlpha = 0.7
        set1.lineWidth = 2
        set1.drawHighlightCircleEnabled = true
        set1.setDrawHighlightIndicators(false)
        
        let set2 = RadarChartDataSet(entries: entries2, label: "This week")
        set2.setColor(UIColor(red: 121/255, green: 162/255, blue: 175/255, alpha: 1))
        set2.fillColor = UIColor(red: 121/255, green: 162/255, blue: 175/255, alpha: 1)
        set2.drawFilledEnabled = true
        set2.fillAlpha = 0.7
        set2.lineWidth = 2
        set2.drawHighlightCircleEnabled = true
        set2.setDrawHighlightIndicators(false)
        
        let data = RadarChartData(dataSets: [set1, set2])
        data.setValueFont(.systemFont(ofSize: 8, weight: .light))
        data.setDrawValues(false)
        data.setValueTextColor(.white)
        
        chartView.data = data
    }
}

extension ModalViewController : IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return activities[Int(value) % activities.count]
        
    }
}
