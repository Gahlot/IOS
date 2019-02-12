//
//  ViewController.swift
//  CollectionViewBasic
//
//  Created by Mahesh Gahlot on 12/18/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var items = Array(1...100)
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(LabelCollectionViewCell.nib, forCellWithReuseIdentifier: LabelCollectionViewCell.identifier)
        collectionView.register(HeaderCollectionReusableView.nib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LabelCollectionViewCell.identifier, for: indexPath) as! LabelCollectionViewCell
        cell.config(String(items[indexPath.row]))
        cell.backgroundColor = items[indexPath.row] % 2 == 0 ? UIColor.yellow : UIColor.green
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
            header.headerLabel.text = "Numbers"
            return header
            
    default:
                assert(false,"Unhnown Kind")
            
        }
    }
}

extension ViewController: UICollectionViewDelegate {
    
}
