//
//  ViewController.swift
//  Homework-5.2
//
//  Created by Андрей Неверовский on 4.04.24.
//

import UIKit

/// Экран 1. Запуск  приложение

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var buttonUp: UIButton!
    
    @IBOutlet weak var buttonDown: UIButton!
    
    @IBOutlet weak var buttonLeft: UIButton!
    
    @IBOutlet weak var buttonRight: UIButton!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    // MARK: - Properties
    
    let circle = UIView()
    var number: CGFloat = 40
    
    //MARK: - Lifecycle funcs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
        
        print("Hello")
        
    }
    
    //MARK: - Enum
    
    enum Direction {
        case up
        case down
        case left
        case right
    }
    
    
    
    
    //MARK: - Flow Functions
    
    func createView() {
        circle.frame =  CGRect(x: 150, y: 150, width: 100, height: 100)
        circle.layer.cornerRadius = 50
        circle.backgroundColor = .black
        view.addSubview(circle)
        
        let recognizerUp = UITapGestureRecognizer(target: self, action: #selector (tapDetectedUp))
        circle.addGestureRecognizer(recognizerUp)
        let recognizerDown = UITapGestureRecognizer(target: self, action: #selector(tapDetectedDown))
        circle.addGestureRecognizer(recognizerDown)
        let recognizerLeft = UITapGestureRecognizer(target: self, action: #selector (tapDetectedLeft))
        circle.addGestureRecognizer(recognizerLeft)
        let recognizerRight = UITapGestureRecognizer(target: self, action: #selector (tapDetectedRight))
        circle.addGestureRecognizer(recognizerRight)
    }
    
    func moveCircle(to direction: Direction) {
        switch direction {
            case .up:
                if circle.frame.origin.y - 50 > view.frame.origin.y {
                    circle.frame.origin.y -= number
                    infoLabel.text = "up"
                    infoLabel.backgroundColor = .green
                } else {
                    infoLabel.text = "error"
                    infoLabel.backgroundColor = .red
                }
            case .down:
                if circle.frame.origin.y + number < buttonUp.frame.origin.y - circle.frame.size.width {
                    circle.frame.origin.y += number
                    infoLabel.text = "down"
                    infoLabel.backgroundColor = .green
                } else {
                    infoLabel.text = "error"
                    infoLabel.backgroundColor = .red
                }
            case .left:
                if circle.frame.origin.x  > number {
                    circle.frame.origin.x -= number
                    infoLabel.text = "left"
                    infoLabel.backgroundColor = .green
                } else {
                    infoLabel.text = "error"
                    infoLabel.backgroundColor = .red
                }
            case .right:
                if view.frame.size.width - circle.frame.origin.x - circle.frame.size.width > number  {
                    circle.frame.origin.x += number
                    infoLabel.text = "right"
                    infoLabel.backgroundColor = .green
                } else {
                    infoLabel.text = "error"
                    infoLabel.backgroundColor = .red
                }
        }
    }
    
    @objc func tapDetectedUp() {
        moveCircle(to: .up)
    }
    
    @objc func tapDetectedDown() {
        moveCircle(to: .down)
    }
    
    @objc func tapDetectedLeft() {
        moveCircle(to: .left)
    }
    
    @objc func tapDetectedRight() {
        moveCircle(to: .right)
    }
    
    //MARK: - IBActions
    
    @IBAction func buttonUpPress(_ sender: UIButton) {
        tapDetectedUp()
    }
    
    @IBAction func buttonDownPress(_ sender: UIButton) {
        tapDetectedDown()
    }
    @IBAction func buttonLeftPress(_ sender: UIButton) {
        tapDetectedLeft()
    }
    
    @IBAction func buttonRightPress(_ sender: UIButton) {
        tapDetectedRight()
    }
    
}

