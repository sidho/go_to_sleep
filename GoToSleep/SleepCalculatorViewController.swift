//
//  SleepCalculatorViewController.swift
//  GoToSleep
//
//  Created by Pivotal on 5/22/16.
//  Copyright © 2016 sidho. All rights reserved.
//

import UIKit

class SleepCalculatorViewController: UIViewController {
    let sleepCalculator = SleepCalculatorModel()

    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var wakeTimeLabel: UILabel!
    @IBOutlet weak var fallAsleepTimeLabel: UILabel!
    @IBOutlet weak var fallAsleepTimeSlider: UISlider!
    
    @IBAction func updateWakeTime(sender: UIDatePicker) {
        updateWakeTimeLabel()
    }
    
    @IBAction func sliderMoved(sender: UISlider) {
        let roundedValue = Float(lroundf(fallAsleepTimeSlider.value))
        print(roundedValue)
        
        updateFallAsleepTimeLabel(roundedValue)
        sender.setValue(roundedValue, animated: true)
    }
    
    @IBAction func closeView(segue:UIStoryboardSegue) {
        
    }

    func updateWakeTimeLabel() {
        wakeTimeLabel.text = timePicker.date.toTimeString()
    }
    
    func updateFallAsleepTimeLabel(minutes: Float) {
        let durationString = String(format: "%.0f", minutes) + " minutes"
        fallAsleepTimeLabel.text = durationString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateWakeTimeLabel()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSleepTimesDetailsView" {
            let sleepTimes = sleepCalculator.calculateSleepTimes(timePicker.date, fallAsleepTime: fallAsleepTimeSlider.value)
            if let destination = segue.destinationViewController as? SleepTimesDetailsViewController {
                destination.sleepTimes = sleepTimes
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

