//
//  SamoleCollectionView.swift
//  sampleCollectionView
//
//  Created by 舘佳紀 on 2020/11/28.
//

import UIKit

class SampleCollectionView: UIView {
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            let nib = UINib(nibName: "SampleCollectionViewCell", bundle: nil)
            collectionView.register(nib, forCellWithReuseIdentifier: "cell")
            
        }
    }
    
    
    let models = Model.createModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    private func loadNib() {
        if let view = Bundle.main.loadNibNamed("SampleCollectionView", owner: self)?.first as? UIView {
            view.frame = self.bounds
            self.addSubview(view)
            collectionView.delegate = self
            collectionView.dataSource = self
            configCollectionView()
        }
    }
    
    private func configCollectionView() {
        // セルの大きさを設定
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionView.frame.width, height: 100)
        collectionView.collectionViewLayout = layout
    }
    
    func debagPrint() {
        print("DEBAG:: call this point?")
    }
}

extension SampleCollectionView : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
}

extension SampleCollectionView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        if let cell = cell as? SampleCollectionViewCell {
            cell.setupCell(model: models[indexPath.row])
        }
        return cell
    }
}
