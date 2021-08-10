//
//  ViewController.swift
//  week2_assignment
//
//  Created by PoChieh Chuang on 2021/8/6.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var funFactTextView: UILabel!
    
    
    @IBAction func showFunFact(_ sender: UIButton) {
        
        let funFacts: [String] = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tempus.",
        "Contrary to popular belief, Lorem Ipsum is not simply random text.",
        "Richard McClintock, a Latin professor at Hampden-Sydney College in ",
        "looked up one of the more obscure Latin words, consectetur",
        "from a Lorem Ipsum passage, and going through the cities of the word",
        "This book is a treatise on the theory of ethics, very popular during the.",
        "The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.."
        ]
        
        let randomInt = Int.random(in: 0...6)
        
        let randomfunFacts = funFacts[randomInt]
        
        funFactTextView.text = randomfunFacts
        
        let backgroundColor: [UIColor] = [
            .black,
            .blue,
            .brown,
            .cyan,
            .lightGray,
            .red,
            .darkGray
        ]
        
        let randomBackgorundColor = backgroundColor[randomInt]
        
        view.backgroundColor = randomBackgorundColor
        
        sender.setTitleColor(randomBackgorundColor, for: .normal)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
