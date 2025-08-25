//
//  ViewController.swift
//  Counter
//
//  Created by Андрей Рузавин on 25/8/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        incrementButton.setTitle("+", for: .normal)
        counterLabel.text = "Значение счетчика: 0"
    }
    
    var counter: Int = 0
    
    @IBAction func didTapIncrementButton(_ sender: Any) {
        counter += 1
        counterLabel.text = "Значение счетчика: \(counter)"
    }
    
}

