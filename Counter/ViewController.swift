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
    
    private var counter: Int = 0 {
        didSet {
            updateUI()
        }
    }
    
    private var history: String = "История изменений:\n"{
        didSet {
            updateHistory()
        }
    }
    
    private let formatter: DateFormatter = {
        let dateString = DateFormatter()
        dateString.dateFormat = "dd.MM HH:mm:ss"
        return dateString
    }()
    
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
        
        updateUI()
        updateHistory()
    }
    
    @IBAction func didTapIncrementButton(_ sender: Any) {
        counter += 1
        let dateString = formatter.string(from: Date())
        historyTextView.text = "\(history)" + "\n\(dateString) : Значение изменено на +1"
        history = historyTextView.text
    }
    
    @IBAction func didTapDecrementButton(_ sender: Any) {
        let dateString = formatter.string(from: Date())
        if counter > 0 {
            counter -= 1
            historyTextView.text = "\(history)" + "\n\(dateString) : Значение изменено на -1"
        } else {
            historyTextView.text = "\(history)" + "\n\(dateString) : попытка уменьшить значение счётчика ниже 0"
        }
        history = historyTextView.text
    }
  
    @IBAction func didTapResetButton(_ sender: Any) {
        counter = 0
        let dateString = formatter.string(from: Date())
        historyTextView.text = "\(history)" + "\n\(dateString) : Значение сброшено"
        history = historyTextView.text
    }
    
    private func updateUI() {
        counterLabel.text = "\(counter)"
//        decrementButton.isEnabled = counter > 0
//        decrementButton.backgroundColor = counter > 0 ? .blue : .systemGray
    }
    
    private func updateHistory() {
        historyTextView.text = "\(history)"
    }
    
}

