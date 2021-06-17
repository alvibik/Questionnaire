//
//  QuestionViewController.swift
//  Questionnaire
//
//  Created by Александр Биктеев on 14.06.2021.
//

import UIKit

class QuestionViewController: UIViewController {
    
    //MARK: - IB Outlets
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleSwitches: [UISwitch]!
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var rangedSlider: UISlider!
    @IBOutlet var questionProgressView: UIProgressView!
   
    //MARK: - IB Action
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = question[questionIndex].answers
        guard let currentIndex = singleButtons.firstIndex(of: sender) else {return}
        let currentAnswer = currentAnswers[currentIndex]
        answerChoosen.append(currentAnswer)
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = question[questionIndex].answers
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answerChoosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = question[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answerChoosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    //MARK: - Private properties
    
    private let question = Question.getQuestion()
    private var questionIndex = 0
    private var answerChoosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    
    
    
    
    //MARK: - Private Methods
    
    private func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        let currentQuestion = question[questionIndex]
        questionLabel.text = currentQuestion.text
        let totalProgress  = Float(questionIndex) / Float(question.count)
        questionProgressView.setProgress(totalProgress, animated: true)
        title = "Вопрос № \(questionIndex + 1) из \(question.count)"
        let currentAnswers = currentQuestion.answers
        switch currentQuestion.type {
        case .single:
            updateSingleStackView(using: currentAnswers)
        case .multiple:
            updateMultipleStackView(using: currentAnswers)
        case .ranged:
            updateRangedStackView(using: currentAnswers)
        }
    }
    
    private func updateSingleStackView(using answers: [Answer]) {
        singleStackView.isHidden = false
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    private func updateMultipleStackView(using answers: [Answer]) {
        multipleStackView.isHidden = false
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    
    private func updateRangedStackView(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
        
    }
    
    //MARK: - Navigation
    private func nextQuestion() {
        questionIndex += 1
        if questionIndex < question.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "resultSegue" else {return}
        let resultVC = segue.destination as! ResultViewController
        resultVC.responses = answerChoosen
    }
    
}
