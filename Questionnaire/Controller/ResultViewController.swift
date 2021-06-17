//
//  ResultViewController.swift
//  Questionnaire
//
//  Created by Александр Биктеев on 14.06.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefenitionLabel: UILabel!
    
    //MARK: - Public properties
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
    
    private func updateResult() {
        var frequencyOfAnimals: [Animal: Int] = [:]
        let animals = responses.map { $0.type}
        
        for animal in animals {
            frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
        }
        
        let sortedfrequencyOfAnimals = frequencyOfAnimals.sorted {$0.value > $1.value}
        
        guard let mostfrequencyOfAnimals = sortedfrequencyOfAnimals.first?.key else {return}
        updateUI(witch: mostfrequencyOfAnimals)
    }
    private func updateUI(witch animal: Animal) {
        resultAnswerLabel.text = "Вы - \(animal.rawValue)"
        resultDefenitionLabel.text = "\(animal.difinition)"
    }
}
