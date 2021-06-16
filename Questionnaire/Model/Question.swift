//
//  Question.swift
//  Questionnaire
//
//  Created by Александр Биктеев on 14.06.2021.
//

struct Question {
    var text: String
    var type: ResponseType
    var answers:[Answer]
}

enum ResponseType {
    case single
    case multiple
    case ranged
}

struct Answer {
    var text: String
    var type: Animal
}

enum Animal : String{
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var difinition : String {
        switch self {
        case .dog:
            return "Вам нравиться быть с друзьями. Вы окружайете себя людьми, которые вам нравяться и всегда готовы вам помочь"
        case .cat:
            return "Вы ссебе на уме. Любите гулять сами по себе. Вы уениите одиночиство."
        case .rabbit:
            return "Ваам нравится все мягкое. Вы здоровы и полны энергии"
        case .turtle:
            return "Ваша сила - в мудрости. Медленный и вдумчивый выигрываете на дальних дистанциях"
        }
    }
}


extension Question {
    static func getQuestion() -> [Question] {
        return [
            Question(
                text: "Какую пищу вы предпочитаете?",
                type: .single,
                answers: [Answer(text: "Стейк", type: .dog),
                          Answer(text: "Рыба", type: .cat),
                          Answer(text: "Морковь", type: .rabbit),
                          Answer(text: "Кукуруза", type: .turtle)
                ]
            ), Question(
                text: "Что вам нравииться больше?",
                type: .multiple,
                answers: [Answer(text: "Плавать", type: .dog),
                          Answer(text: "Спать", type: .cat),
                          Answer(text: "Обниматься", type: .rabbit),
                          Answer(text: "Есть", type: .turtle)
                ]
            ), Question(
                text: "Любите ли вы поездки на машине?",
                type: .ranged,
                answers: [Answer(text: "Ненавижу", type: .dog),
                          Answer(text: "Нервничаю", type: .cat),
                          Answer(text: "Не замечааю", type: .rabbit),
                          Answer(text: "Обожаю", type: .turtle)
                ]
            )
        ]
    }
}
