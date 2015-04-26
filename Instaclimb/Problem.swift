//
//  Problem.swift
//  Instaclimb
//
//  Created by Jay Peterson on 4/25/15.
//  Copyright (c) 2015 JL Corp. All rights reserved.
//

import Foundation

class Problem {
  var grade: Int?
  var dates: [NSDate]

  init(grade: Int) {
    self.grade = grade
    self.dates = [NSDate]()
    self.dates.append(NSDate())
  }
}