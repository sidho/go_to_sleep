//
//  SleepTimeDetailsViewController.swift
//  GoToSleep
//
//  Created by Pivotal on 5/22/16.
//  Copyright © 2016 sidho. All rights reserved.
//

import UIKit

class SleepTimesDetailsViewController: UIViewController {
    var sleepTimes: Dictionary<Int,NSDate> = [:]
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var sleepTimesTextArea: UITextView!
    
    func setSleepTimesTextAreaText() {
        sleepTimesTextArea.text = buildSleepTimesString(sleepTimes)
        sleepTimesTextArea.font = UIFont(name: "HelveticaNeue", size: 16)
    }
    
    private func buildSleepTimesString(wakeTimes: [Int:NSDate]) -> String {
        var sleepTimesString = ""
        for i in 0...5 {
            sleepTimesString += wakeTimes[6 - i]!.toTimeString() + " (\(6-i) sleep cycles) \n"
        }
        
        return sleepTimesString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSleepTimesTextAreaText()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
