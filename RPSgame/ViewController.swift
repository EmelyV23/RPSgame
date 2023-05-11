//
//  ViewController.swift
//  RPSgame
//
//  Created by Emely Valadez-Bernal on 2/8/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countdown: UILabel!
    var timerCount = 3
    let layer = CAEmitterLayer()
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        doSomething(x: CGPoint(x: view.center.x, y: view.center.y))
    }
    func doSomething(x: CGPoint){
        layer.emitterPosition = x
        let cell = CAEmitterCell()
        cell.scale = 0.05
        cell.emissionRange = .pi * 2
        cell.lifetime = 60
        cell.birthRate = 2
        cell.velocity = 100
        cell.scaleRange = 0.1
        cell.contents = UIImage(named: "frog")!.cgImage
        layer.emitterCells = [cell]
        layer.zPosition = -1
        cell.spin = 3
        view.layer.addSublayer(layer)
    }
    @IBAction func tapRec(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: self.view)
        layer.removeFromSuperlayer()
        doSomething(x: point)
    }
    
    @IBAction func timerStop(_ sender: UIButton) {
        layer.removeFromSuperlayer()
        countdown.text = "3"
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    @objc func fireTimer(){
        timerCount -= 1
           if timerCount == 0{
                timer.invalidate()
                timerCount = 3
                doSomething(x: CGPoint(x: view.center.x, y: view.center.y))
            }else{
               countdown.text = "\(timerCount)"
            }
       }
    }


