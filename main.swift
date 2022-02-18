//
//  main.swift
//  exercise
//
//  Created by 손원빈 on 2022/02/14.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    func checkBodyCondition() {
        print("""
        현재의 컨디션은 다음과 같습니다.
        상체근력: \(upperBodyStrength)
        하체근력: \(lowerBodyStrength)
        근지구력: \(muscularEndurance)
        피로도: \(fatigue)
        """)
    }
}

struct Exercise {
    let name: String
    let action: (BodyCondition) -> Void
}
class Routine {
    var routineName: String
    var routineCorse: [Exercise]
    var person: BodyCondition
    init(routinName:String, routineCorse: [Exercise], person: BodyCondition) {
        self.routineName = routinName
        self.routineCorse = routineCorse
        self.person = person
    }
    
    func start() {
        print("""
        ------------
        \(routineName)을 시작합니다.
        """)
        
        for exercise in routineCorse {
            print(exercise.name)
            exercise.action(person)
        }
        print("------------")
        person.checkBodyCondition()
        
    }
}
let sitUp: Exercise = Exercise(name: "윗몸일으키기", action: {$0.upperBodyStrength += Int.random(in: 10...20); $0.fatigue += Int.random(in: 10...20)})
let squat: Exercise = Exercise(name: "스쿼트", action: {$0.lowerBodyStrength += Int.random(in: 10...20); $0.fatigue += Int.random(in: 10...20)})
let runnig: Exercise = Exercise(name: "달리기", action: {$0.muscularEndurance += Int.random(in: 20...30)
    $0.upperBodyStrength += Int.random(in: 5...10);$0.lowerBodyStrength += Int.random(in: 5...10); $0.fatigue += Int.random(in: 20...30)
})
let rest: Exercise = Exercise(name: "동적휴식", action: {$0.fatigue -= Int.random(in: 5...10)})

var onebinBodyCondition: BodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)
var hellRoutine: Routine = Routine(routinName: "hellRoutine", routineCorse: [squat,sitUp,runnig,rest], person: onebinBodyCondition)
hellRoutine.start()
