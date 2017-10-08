//
//  FirstViewController.swift
//  GestureRecogniser
//
//  Created by Darragh on 10/8/17.
//  Copyright © 2017 Darragh. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var squareView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        squareView = UIView(frame: CGRect(x: 150, y: 250, width: 100, height: 100))
        squareView.backgroundColor = .blue
        view.addSubview(squareView)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
        
        squareView.addGestureRecognizer(panGesture)
    }

    @objc func handlePan(recognizer: UIPanGestureRecognizer) {
        let translationInView = recognizer.translation(in: self.view)
        recognizer.view!.center = CGPoint(x:view.center.x + translationInView.x, y:view.center.y + translationInView.y)
    }


}

