//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
// import ProgressHUD - This looks just like SVProgess hud -
// it is extremely cool.

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var currentQuestion: Int = 0
    var correctAnswers: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentQuestion = 0
        correctAnswers = 0
        scoreLabel.text = "Score: \(correctAnswers)"
        questionLabel.text = allQuestions.list[currentQuestion].questionText
        progressLabel.text = "\(currentQuestion+1) / \(allQuestions.list.count)"
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        } else {
            pickedAnswer = false
        }
        
        checkAnswer()
        // Show Answer and Progress
        scoreLabel.text = "Score: \(correctAnswers)"
        nextQuestion()
    }
    
    
    func updateUI() {
        questionLabel.text = allQuestions.list[currentQuestion].questionText
        progressLabel.text = "\(currentQuestion+1) / \(allQuestions.list.count)"
        
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(currentQuestion+1)
    }
    

    func nextQuestion() {
        currentQuestion += 1
        if currentQuestion >= allQuestions.list.count {
            let alert = UIAlertController(title: "Completed", message: "Do you want to restart?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "restart?", style: .default, handler:
            {
                (UIAlertAction) in
                    self.startOver()
              })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        } else {
            updateUI()
        }
    }
    
    
    func checkAnswer() {
        let correctAnswer: Bool = allQuestions.list[currentQuestion].answer
        
        if pickedAnswer == correctAnswer {
            // Correct
            print("Correct")
            correctAnswers += 1
            ProgressHUD.showSuccess("Correct")
        } else {
            // Incorrect
            ProgressHUD.showError("Wrong")
            print("Incorrect Answer")
        }
    }
    
    
    func startOver() {
        currentQuestion = 0
        correctAnswers = 0
        updateUI()
    }
    

    
}
