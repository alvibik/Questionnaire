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
   
    //MARK: - Private properties
    
    private let question = Question.getQuestion()
    private var questionIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    //MARK: - Private M ethods
    
    private func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        let currentQuestion = question[questionIndex]
        questionLabel.text = currentQuestion.text
        
        let totalProgress  = Float(questionIndex / question.count)
        
        questionProgressView.setProgress(totalProgress, animated: true)
        
        title = "Вопрос № \(questionIndex + 1) из \(question.count)"
    }
}
