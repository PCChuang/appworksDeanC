//
//  ViewController.swift
//  week4_assignment3_xcode
//
//  Created by PoChieh Chuang on 2021/8/18.
//

import UIKit

struct Station: Codable {
    let stationID: String
    let stationName: String
    let stationAddress: String
}

class ViewController: UIViewController {

    @IBOutlet weak var stationIDLabel: UILabel!
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var stationAddressLabel: UILabel!
    
    let queue = OperationQueue()
    let operation = LoadStationInfoOperation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stationNameLabel.frame.origin = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2 + 100)
        
        loadStationInfo()
        
        operation.urlTaskCompletionHandler = { station in
            OperationQueue.main.addOperation {
                self.stationIDLabel.text = station.stationID
                self.stationNameLabel.text = station.stationName
                self.stationAddressLabel.text = station.stationAddress
            }
        }
        

        
    }
    

    func loadStationInfo(){
        queue.addOperations([operation], waitUntilFinished: true)
        print("Operations finished")
    }
    
}



