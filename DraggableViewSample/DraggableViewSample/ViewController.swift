//
//  ViewController.swift
//  DraggableViewSample
//
//  Created by Uğuralp ÖNBAŞLI on 11.11.2018.
//  Copyright © 2018 Uğuralp ÖNBAŞLI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var secondView: UIView!
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    @IBOutlet weak var dragView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func panGestureAction(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: dragView)
        
        sender.view?.center =  CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
        
        if sender.view!.center.x == 264 && sender.view!.center.y == 574{
            print("you got it dude!")
        }
        
        if dragView.frame.intersects(secondView.frame){
            switch sender.state {
            case .ended:
                print("deneme")
                dragView.backgroundColor = UIColor.green
            default:
                print("not intersects yet")
            }
        }
        
        switch sender.state {
        case .changed:
            dragView.backgroundColor = UIColor.blue
        default:
            print("not changed")
        }
        

        sender.setTranslation(CGPoint.zero, in: self.view)
        
    }
    
}

