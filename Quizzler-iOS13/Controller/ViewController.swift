//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
   
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        progressBar.progress = 0;
        // Do any additional setup after loading the view.
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!;
        let userGotItRight =  quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
    }
    
    @objc func updateUI(){
        progressBar.progress = quizBrain.getProgress()
        questionLabel.text = quizBrain.getQuestionText()
        
        let options = quizBrain.getOptionsText()
        optionA.setTitle(options[0], for: .normal)
        optionB.setTitle(options[1], for: .normal)
        optionC.setTitle(options[2], for: .normal)
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        optionA.backgroundColor = UIColor.clear
        optionB.backgroundColor = UIColor.clear
        optionC.backgroundColor = UIColor.clear
    }
}

