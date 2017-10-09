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
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation(recognizer:)))
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(recognizer:)))
        
        let screenEdgePanGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleScreenEdgePan(recognizer:)))
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp)
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: Selector(("longPressed:")))
        self.view.addGestureRecognizer(longPressRecognizer)
        
        squareView.gestureRecognizers = [panGesture, tapGesture, rotateGesture, pinchGesture, screenEdgePanGesture, swipeRight, swipeDown, swipeUp, swipeLeft, longPressRecognizer]
        screenEdgePanGesture.edges = .left
    }

    @objc func handlePan(recognizer: UIPanGestureRecognizer) {
        let translationInView = recognizer.translation(in: self.view)
        recognizer.view!.center = CGPoint(x:view.center.x + translationInView.x, y:view.center.y + translationInView.y)
    }

    @objc func handleTap(recognizer: UITapGestureRecognizer) {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        recognizer.view?.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    @objc func handleRotation(recognizer: UIRotationGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.rotated(by: recognizer.rotation)
            recognizer.rotation = 0
        }
    }
    
    @objc func handlePinch(recognizer: UIPinchGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
            recognizer.scale = 1
        }
    }
    
    @objc func handleScreenEdgePan(recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            print("Screen edge swiped!")
        }
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right")
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
            default:
                break
            }
        }
    }
    
    @objc func longPressed(sender: UILongPressGestureRecognizer)
    {
        print("longpressed")
    }
}

