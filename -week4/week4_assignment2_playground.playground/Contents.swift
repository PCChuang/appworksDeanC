import UIKit

let findingOddClosure = { (number: Int) -> Bool in
    if number % 2 != 0 {
        return true
    } else {
        return false
    }
}
