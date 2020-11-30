//
//  SampleCollectionViewModel.swift
//  sampleCollectionView
//
//  Created by 舘佳紀 on 2020/11/29.
//

import Foundation

struct Model {
    let title : String
    let context : String
    
    static func createModel() -> [Model] {
        return [
            Model(title: String("1"), context: "hoge"),
            Model(title: String("2"), context: "hoge"),
            Model(title: String("3"), context: "hoge"),
            Model(title: String("4"), context: "hoge")
        ]
    }
}
