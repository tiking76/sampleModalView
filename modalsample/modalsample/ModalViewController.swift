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
    
    let activities = ["Burger", "Steak", "Salad", "Pasta", "Pizza"]
    
    override func viewDidLoad() {
        view.backgroundColor = .black
        super.viewDidLoad()
        chartView.delegate = self
        
        //枠線
        chartView.chartDescription?.enabled = false
        chartView.rotationEnabled = false
        chartView.webLineWidth = 0.5
        chartView.innerWebLineWidth = 0.5
        chartView.webColor = .lightGray
        chartView.innerWebColor = .lightGray
        chartView.webAlpha = 1
        
        //x軸
        let xAxis = chartView.xAxis
        xAxis.labelFont = .systemFont(ofSize: 9, weight: .light)
        xAxis.xOffset = 0
        xAxis.yOffset = 0
        xAxis.valueFormatter = self
        xAxis.labelTextColor = .white
        
        //y軸
        let yAxis = chartView.yAxis
        yAxis.labelFont = .systemFont(ofSize: 9, weight: .light)
        yAxis.labelCount = 5
        yAxis.axisMinimum = 0
        yAxis.axisMaximum = 80
        yAxis.drawLabelsEnabled = false
        
        //凡例
        let legend = chartView.legend
        legend.horizontalAlignment = .right
        legend.verticalAlignment = .center
        legend.orientation = .vertical
        legend.drawInside = false
        legend.font = .systemFont(ofSize: 10, weight: .light)
        legend.xEntrySpace = 7
        legend.yEntrySpace = 5
        legend.textColor = .white
        
        self.setCharData()
        
        chartView.animate(xAxisDuration: 1.4, yAxisDuration: 1.4, easingOption: .easeOutBack)

    }
    
    func setCharData() {
        let mult : UInt32 = 80
        let min : UInt32 = 20
        let count = 5
        
        let block: (Int) -> RadarChartDataEntry = { _ in return RadarChartDataEntry(value: Double(arc4random_uniform(mult) + min))
        }
        
        let entries1 = (0..<count).map(block)
        let entries2 = (0..<count).map(block)
        
        print(type(of: entries1))
        print(type(of: entries1[0]))
        print(entries1[0])
        
        
        let set1 = RadarChartDataSet(entries: entries1, label: "Last Week")
        //枠線
        set1.setColor(.red)
        //範囲領域
        set1.fillColor = .red
        //塗り潰し
        set1.drawFilledEnabled = false
        //領域のalpha値
        set1.fillAlpha = 0.7
        //枠線の太さ
        set1.lineWidth = 1
        //丸のサークルをクリック時に出すか
        set1.drawHighlightCircleEnabled = false
        //ポインターに対して座標線みたいなものを出すか
        set1.setDrawHighlightIndicators(false)
        
        let set2 = RadarChartDataSet(entries: entries2, label: "This week")
        set2.setColor(UIColor(red: 121/255, green: 162/255, blue: 175/255, alpha: 1))
        set2.fillColor = UIColor(red: 121/255, green: 162/255, blue: 175/255, alpha: 1)
        set2.drawFilledEnabled = false
        set2.fillAlpha = 0.7
        set2.lineWidth = 1
        set2.drawHighlightCircleEnabled = false
        set2.setDrawHighlightIndicators(false)
        
        let data = RadarChartData(dataSets: [set1, set2])
        data.setValueFont(.systemFont(ofSize: 8, weight: .light))
        //それぞれの値を表示するかどうか
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
