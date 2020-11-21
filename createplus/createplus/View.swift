//
//  View.swift
//  createplus
//
//  Created by 舘佳紀 on 2020/11/21.
//

import UIKit

class View: UIView {
    var color : UIColor = UIColor.orange
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        //始点
        path.move(to: CGPoint(x: 50, y: 100))
        //曲線
        path.addCurve(to: CGPoint(x: 130, y: 100),
                      controlPoint1: CGPoint(x: 60, y: 20),
                      controlPoint2: CGPoint(x: 115, y: 20))
        path.lineWidth = 20.0 // 線の太さ
        
        color.setStroke() // 色をセット
        //描画？
        path.stroke()
    }
}
