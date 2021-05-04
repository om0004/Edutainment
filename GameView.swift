//
//  GameView.swift
//  Edutainment
//
//  Created by om on 27/04/21.
//

import SwiftUI

struct GameView: View
{
    @State private var answer:String=""
    var tableValue:Int
    var questionNo:Int
    var noOfQuestions:[Int]
    @State private var element2:Int=1
    @State private var element1:Int=1
    @State private var checkAlert=false
    @State private var alertTitle=""
    @State private var alertMessage=""
    @State private var score=0
    init(tableValue:Int,questionNo:Int,noOfQuestions:[Int])
    {
        self.tableValue=tableValue;
        self.questionNo=questionNo;
        self.noOfQuestions=noOfQuestions;
        
    }
    func startGame()
    {
        self.element2=Int.random(in:1...10);
        self.element1=Int.random(in:1...tableValue);
        answer=""
    }
    func checkAnswer()
    {
        score+=1
        checkAlert=true
        if score == noOfQuestions[questionNo]
        {
            self.alertTitle="Well played"
            self.alertMessage="Lets play at a higher difficulty now!"
        }
        
        else
        {
            if Int(answer) ?? 0 == element2*element1
            {
                self.alertTitle="Correct!"
                self.alertMessage="Lets do the next Question"
            }
            else
            {
                    self.alertTitle="Wrong!"
                    self.alertMessage="Lets do the next Question"
            }
        }
    }
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                Form
                {
                    Text("what is \(element1) * \(element2) ?")
                    TextField("Enter your answer",text:$answer,onCommit:checkAnswer)
                    
                }
                .alert(isPresented:$checkAlert)
                {
                    Alert(title:Text("\(alertTitle)"), message:Text("\(alertMessage)"), dismissButton:.default(Text("ok"))
                            {
                                startGame()
                            })
                    
                }
                .animation(Animation.interpolatingSpring(stiffness:2, damping:2))
            }
        }
        .onAppear(perform:{startGame()})
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(tableValue: 6, questionNo: 2,noOfQuestions:[5,10,15,20])
    }
}
