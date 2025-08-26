//
//  ViewController.swift
//  Counter
//
//  Created by Андрей Рузавин on 25/8/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var decrementButton: UIButton!
    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        counterLabel.text = "0"
        
        incrementButton.setImage(UIImage(systemName: "plus"), for: .normal)
        incrementButton.setTitle("", for: .normal)
        incrementButton.backgroundColor = .red
        incrementButton.layer.cornerRadius = 5
        
        decrementButton.setImage(UIImage(systemName: "minus"), for: .normal)
        decrementButton.setTitle("", for: .normal)
        decrementButton.backgroundColor = .blue
        decrementButton.layer.cornerRadius = 5
        
        resetButton.setImage(UIImage(systemName: "arrow.counterclockwise"), for: .normal)
        resetButton.setTitle("", for: .normal)
        resetButton.backgroundColor = .green
        resetButton.layer.cornerRadius = 5
    }
    
    @IBAction func didTapIncrementButton(_ sender: Any) {
        counter += 1
        counterLabel.text = "\(counter)"
    }
    
    @IBAction func didTapDecrementButton(_ sender: Any) {
        counter -= 1
        counterLabel.text = "\(counter)"
    }
  
    @IBAction func didTapResetButton(_ sender: Any) {
        counter = 0
        counterLabel.text = "\(counter)"
    }
}

