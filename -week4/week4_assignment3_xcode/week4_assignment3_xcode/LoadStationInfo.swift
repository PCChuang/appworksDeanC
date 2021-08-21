//
//  LoadStationInfo.swift
//  week4_assignment3_xcode
//
//  Created by PoChieh Chuang on 2021/8/19.
//

import Foundation

//MARK: Creating Ansynchronous Operation
class LoadStationInfoOperation: Operation {
    
    var urlTaskCompletionHandler:((Station) -> ())?
    
    private let lockQueue = DispatchQueue(label: "com.pcc.loadStationInfoOperation", attributes: .concurrent)
    
    override var isAsynchronous: Bool {
        return true
    }

//MARK: Managing the state of Asynchronous Operation
    
    //override isExecuting & isFinished properties with multi-threading & KVO support
    private var _isExecuting: Bool = false
    override private(set) var isExecuting: Bool {
        get {
            return lockQueue.sync { () -> Bool in
                return _isExecuting
            }
        }
        set {
            willChangeValue(forKey: "isExecuting")
            lockQueue.sync(flags: [.barrier]) {
                _isExecuting = newValue
            }
            didChangeValue(forKey: "isExecuting")
        }
    }

    private var _isFinished: Bool = false
    override private(set) var isFinished: Bool {
        get {
            return lockQueue.sync { () -> Bool in
                return _isFinished
            }
        }
        set {
            willChangeValue(forKey: "isFinished")
            lockQueue.sync(flags: [.barrier]) {
                _isFinished = newValue
            }
            didChangeValue(forKey: "isFinished")
        }
    }

    //update state
    override func start() {
        print("Starting")
        guard !isCancelled else {
            finish()
            return
        }

        isFinished = false
        isExecuting = true
        main()
    }
    
    override func main() {
        
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(1), execute: {
            let configuration = URLSessionConfiguration.default
            let session = URLSession(configuration: configuration)

            let url = URL(string: "https://stations-98a59.firebaseio.com/practice.json")!
            let task = session.dataTask(with: url) {
                (data, response, error) in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    return
                }
                guard let data = data else {
                    print(error.debugDescription)
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(Station.self, from: data)
                    self.urlTaskCompletionHandler?(result)
                }
                catch {
                    print (error)
                }
            }
            task.resume()
            self.finish()
        })
    }
    
    //set state to finished
    func finish() {
        isExecuting = false
        isFinished = true
    }
}
