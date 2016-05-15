//
//  Timer.swift
//  game_engine
//
//  Created by Michał Kalinowski on 15/05/16.
//
//

import MachO

struct Timer {
  private var startTime: UInt64 = 0
  private var endTime: UInt64 = 0
  private var clockTimebase = mach_timebase_info(numer: 0, denom: 0)
  
  init() {
    mach_timebase_info(&clockTimebase)
  }
  
  mutating func start() {
    startTime = mach_absolute_time()
  }
  
  mutating func stop() {
    guard startTime > 0 else {
      // Can not stop the timer, it was never started
      return
    }
    endTime = mach_absolute_time()
  }
  
  private func elapsedMach() -> Double {
    return Double((endTime - startTime) * UInt64(clockTimebase.numer)) / Double(clockTimebase.denom)
  }
  
  func resultInSeconds() -> Double {
    return elapsedMach() / 1_000_000_000
  }
  
  func resultInMilis() -> Double {
    return elapsedMach() / 1_000_000
  }
}
