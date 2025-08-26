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
    
    private var history: [String] = ["История изменений:"] {
        didSet {
            updateHistory()
        }
    }
    
    private let formatter: DateFormatter = {
        let dateString = DateFormatter()
        dateString.dateFormat = "[dd.MM.yyyy HH:mm:ss]"
        return dateString
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        historyTextView.isEditable = false
        historyTextView.isSelectable = false
        
        incrementButton.setImage(UIImage(systemName: "plus"), for: .normal)
        incrementButton.setTitle("", for: .normal)
        incrementButton.backgroundColor = .systemRed
        incrementButton.tintColor = .white
        incrementButton.layer.cornerRadius = 5
        
        decrementButton.setImage(UIImage(systemName: "minus"), for: .normal)
        decrementButton.setTitle("", for: .normal)
        decrementButton.backgroundColor = .systemBlue
        decrementButton.tintColor = .white
        decrementButton.layer.cornerRadius = 5
        
        resetButton.setImage(UIImage(systemName: "arrow.counterclockwise"), for: .normal)
        resetButton.setTitle("", for: .normal)
        resetButton.backgroundColor = .systemGreen
        resetButton.tintColor = .white
        resetButton.layer.cornerRadius = 5
        
        updateUI()
        updateHistory()
    }
    
    @IBAction func didTapIncrementButton(_ sender: Any) {
        counter += 1
        let dateString = formatter.string(from: Date())
        history.append("\(dateString): Значение изменено на +1")
        
    }
    
    @IBAction func didTapDecrementButton(_ sender: Any) {
        let dateString = formatter.string(from: Date())
        if counter > 0 {
            counter -= 1
            history.append("\(dateString): Значение изменено на -1")
        } else {
            history.append("\(dateString): Попытка уменьшить значение счётчика ниже 0")
        }
    }
  
    @IBAction func didTapResetButton(_ sender: Any) {
        counter = 0
        let dateString = formatter.string(from: Date())
        history.append("\(dateString): Значение сброшено")
    }
    
    private func updateUI() {
        counterLabel.text = "\(counter)"
//        decrementButton.isEnabled = counter > 0
//        decrementButton.backgroundColor = counter > 0 ? .blue : .systemGray
    }
    
    private func updateHistory() {
        historyTextView.text = history.joined(separator: "\n")
        autoScroll()
    }
    
    private func autoScroll() {
        let bottomRange = NSMakeRange(historyTextView.text.count - 1, 0)
        historyTextView.scrollRangeToVisible(bottomRange)
    }
    
}

