//
//  ViewController.swift
//  MyUIKit
//
//  Created by Mahesh Gahlot on 10/30/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var timeLeft: UILabel!
    @IBOutlet weak var score: UILabel!
    var count = 30
    var scores = 0
    var text: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLeft.text = timeLeft.text! + String(count)
        text = score.text!
        score.text = text + String(scores)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


    @IBAction func scoreCalculate(_ sender: UIButton) {
        if scores == 0 {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 0) + 3) {
            self.button.isEnabled = false
            
            let alert  = UIAlertController(title: "Time up", message: "Your Score is \(self.scores)", preferredStyle: UIAlertControllerStyle.alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive, handler: nil )
            alert.addAction(cancelAction)
            //cancelAction.isEnabled = false
            let restart = UIAlertAction(title: "Restart", style: UIAlertActionStyle.default, handler: { (restart) in
                self.count = 30
                self.scores = 0
                self.timeLeft.text = "Time: " + String(self.count)
                self.score.text = "Scores: " + String(self.scores)
                self.button.isEnabled = true
            })
            alert.addAction(restart)
            self.present(alert, animated: true, completion:nil )
            
            };
            
        }
        
        scores += 1
        score.text = text + String(scores)
    }
    
}

