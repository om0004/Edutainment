//
//  ContentView.swift
//  Edutainment
//
//  Created by om on 14/04/21.
//

import SwiftUI
struct ContentView: View
{
    @State private var tableValue=5;
    @State private var noOfQuestions:[Int]=[5,10,15,20];
    @State private var questionNo=1;
    var body: some View
    {
        NavigationView
        {
            GeometryReader
            {
                geo in
            VStack
            {
                Form
                {
                    Section(header:Text("Choose multiplication table limit"))
                    {
                        Stepper(value:$tableValue,in:1...10,step:1)
                        {
                            Text("Upto \(tableValue)'s Table")
                        }
                    }
                    
                    Section(header:Text("Choose number of Questions"))
                    {
                        Picker("select",selection:$questionNo)
                        {
                            ForEach(0..<noOfQuestions.count)
                            {
                                Text("\(noOfQuestions[$0])")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                .frame(width:geo.size.width)
                VStack
                    {
                        Button(action:{})
                        {
                            ZStack
                            {
                                RoundedRectangle(cornerRadius:5)
                                    .frame(width:150,height:55)
                                    .foregroundColor(.black)
                                NavigationLink(destination:GameView(tableValue:self.tableValue, questionNo:self.questionNo,noOfQuestions:self.noOfQuestions))
                               {
                                    Text("Lets Play")
                               }
                                .foregroundColor(.white)
                               // .animation(.easeInOut(duration: 1))
                            }
                        }
                    }
                .frame(width:geo.size.width,height:geo.size.height/1.5)
                   
                }
            }
        }
            .navigationBarTitle("Edutainment")
        }
    }
struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
