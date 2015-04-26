//
//  ViewController.swift
//  Instaclimb
//
//  Created by Jay Peterson on 4/25/15.
//  Copyright (c) 2015 JL Corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var timerLabel: UILabel!

  var timer: NSTimer!
  var prevTime: NSDate?
  var problems = [Problem]()

  @IBAction func vButtonPressed(sender: UIButton) {
    var text  = sender.titleLabel!.text!
    text.replaceRange(Range(start: text.startIndex, end: advance(text.startIndex, 1)), with: "")
    var grade = text.toInt()!

    let alert = UIAlertController(title: "Add V\(text)?", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
    let addSimpleAlertAction = UIAlertAction(title: "Add", style: UIAlertActionStyle.Default, handler: makeAddSimpleHandler(grade))

    alert.addAction(addSimpleAlertAction)
    alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action) in }))
    presentViewController(alert, animated: true, completion: nil)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTimer", userInfo: nil, repeats: true)
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func updateTimer() {
    if let prevTime = prevTime {
      let now = NSDate()
      let interval = now.timeIntervalSinceDate(prevTime)
      let dateFormatter = NSDateFormatter()
      dateFormatter.dateFormat = "mm:ss"
      timerLabel.text = dateFormatter.stringFromDate(NSDate(timeIntervalSince1970: interval))
    }
  }

  func makeAddSimpleHandler(grade: Int) -> ((UIAlertAction!) ->Void) {
    func handler(action: UIAlertAction!) {
      prevTime = NSDate()
      updateTimer()

      problems.append(Problem(grade: grade))
    }
    return handler
  }

}

