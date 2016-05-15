# Timer
Utility for timing your swift methods

## Usage

```swift
var timer = Timer()
var results: [Double] = []
for i in 1..<1000 {
  timer.start()
  
  _ = testDict[i]
  
  timer.stop()
  results.append(timer.resultInMilis())
}

let average = results.reduce(0, combine: +) / Double(results.count)
print("average time to do operation: \()")
```


