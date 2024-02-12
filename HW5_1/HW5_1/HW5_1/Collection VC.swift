//
//  Collection VC.swift
//  Lect3
//
//  Created by user on 09.02.2024.
//  Copyright © 2024 user. All rights reserved.
//

import UIKit

final class CollectionVC: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor =  .green
        collectionView.register(CustomCollectionNewCell.self, forCellWithReuseIdentifier: "cell")
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        guard let cell = cell as? CustomCollectionNewCell else {
            return UICollectionViewCell()
        }
        cell.tapOnCell = { [weak self] image in
            
            let animation = CATransaction()
            animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            animation.type = .fade
            animation.duration = 2
            self?.navigationController?.view.layer.add(animation, forKey: nill)
            self?.navigationController?.pushViewController(ImaveViewController(image: image), animated: false)
        }
        return cell
    }
}
