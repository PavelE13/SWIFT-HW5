//
//  ImageViewController.swift
//  Lect3
//
//  Created by user on 09.02.2024.
//  Copyright © 2024 user. All rights reserved.
//

import UIKit

final class ImaveViewController: UIViewController {
    
    private var myImage = UIImageView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
        addConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.myImage.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            self.myImage.transform = CGAffineTransform(rotationAngle: 45)
        })
        
        UIView.animate(withDuration: 3, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.myImage.layer.opacity = 0
        })
    }
    
    init(image: UIImage) {
        
        super.init(nibName: nil, bundle:  nil)
        myImage.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        view.addSubview(myImage)
    }
    
    private func addConstraints() {
        
        myImage.translatesAutoresizingMaskIntoConstraints =
        false
        
        NSLayoutConstraint.activate([
            myImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myImage.widthAnchor.constraint(equalToConstant: view.frame.size.width/2),
            myImage.heightAnchor.constraint(equalTo: myImage.widthAnchor)
            ])
    }
}
