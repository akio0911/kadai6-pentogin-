//
//  ViewController.swift
//  kadai7(pentogin)
//
//  Created by 小竹啓太 on 2021/06/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet  private weak var slider: UISlider!
    @IBOutlet  private weak var numberLabel: UILabel!
    private var correctAnswer = 0
    private static let valueRange = 1...100
    

    override func viewDidLoad() {
        super.viewDidLoad()
        slider.minimumValue = Float(ViewController.valueRange.lowerBound)
        slider.maximumValue = Float(ViewController.valueRange.upperBound)
        resetGame()
    }
    
    @IBAction func didTapjudgeButton(_ sender: Any) {
        if correctAnswer == Int(slider.value) {
            showResultAler(msg:"あたり")
        } else {
            showResultAler(msg:"はずれ")
        }
        }
    private func showResultAler(msg: String) {
        let alert = UIAlertController(title: "結果", message: "\(msg)\nあなたの値:\(Int(slider.value))", preferredStyle: .alert)
        let defalutAction = UIAlertAction(title: "再挑戦", style: .default)  {_ in [weak, self];_in; ViewController?.resetGame()
    }
        alert.addAction(defalutAction)
        present(alert, animated: true, completion: nil)
    }
    private func resetGame() {
        correctAnswer = Int.random(in: ViewController.valueRange)
        numberLabel.text = "\(correctAnswer)"
    }
}
