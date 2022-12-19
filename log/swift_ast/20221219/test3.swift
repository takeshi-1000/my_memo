$ cat test3.swift 
import Foundation

let scores = [100, 80, 85]

let results = scores.map {
    if $0 >= 85 {
        return "\($0)%: Pass"
    } else {
        return "\($0)%: Fail"
    }
}

print("hoge")
