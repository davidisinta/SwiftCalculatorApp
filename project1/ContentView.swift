//
//  ContentView.swift
//  project1
//
//  Created by David Isinta Nyakawa on 12/5/23.
//

import SwiftUI

enum CalculatorMode{
    case notSet
    case addition
    case subtraction
    case multiplication
    case division
}

struct ContentView: View {
    
    @State var currentValue = "0"
    @State var currentMode: CalculatorMode = .notSet
    @State var lastButtonWasMode = false
    @State var savedNum = 0
    @State var currentValueInt = 0
    var body: some View {
        
        ZStack {
            
          
            Color(.black)
            VStack {
                TotalText(value: currentValue)
                HStack {
                    CalculatorButton(action:didPressNumber)
                    CalculatorButton(buttonText: "2",action:didPressNumber)
                    CalculatorButton(buttonText: "3",action:didPressNumber)
                    CalculatorButton(buttonText: "+", buttonColor: .green, action: didPressMode, mode: .addition)
                    
                }
                
                HStack {
                    CalculatorButton(buttonText: "4",action:didPressNumber)
                    CalculatorButton(buttonText: "5",action:didPressNumber)
                    CalculatorButton(buttonText: "6",action:didPressNumber)
                    CalculatorButton(buttonText: "-", buttonColor: .green , action: didPressMode, mode: .subtraction)
                    
                }
                
                HStack {
                    CalculatorButton(buttonText: "7",action:didPressNumber)
                    CalculatorButton(buttonText: "8",action:didPressNumber)
                    CalculatorButton(buttonText: "9",action:didPressNumber)
                    CalculatorButton(buttonText: "x", buttonColor: .green , action: didPressMode, mode: .multiplication)
                    
                }
                
                HStack {
                    CalculatorButton(buttonText: "C", buttonColor: .gray,action:didPressClear)
                    CalculatorButton(buttonText: "0",action:didPressNumber)
                    CalculatorButton(buttonText: "=",buttonColor: .green,action:didPressEquals)
                    CalculatorButton(buttonText: "/", buttonColor: .green , action: didPressMode,  mode: .division)
                    
                }
            }
           
        }
        .ignoresSafeArea()
    }
    
    func didPressNumber(button: CalculatorButton)
    {
        if lastButtonWasMode{
            lastButtonWasMode = false
            currentValueInt=0
        }
        
        
       if let parsedValue = Int("\(currentValueInt)" + button.buttonText)
        {
           currentValueInt = parsedValue
           updateText()
       }
        
        else
        {
            currentValue="error detected"
            currentValueInt=0
        }
        
    }
    
    
    func updateText()
    {
        if currentMode == .notSet
        {
            savedNum=currentValueInt
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle  = .decimal
        
        let num = NSNumber(value:currentValueInt)
        
        currentValue = numberFormatter.string(from:num) ?? "error"
        
    }
    
    
    func didPressMode(button: CalculatorButton)
    {
        currentMode=button.mode
        lastButtonWasMode=true
        
    }
    
    func didPressEquals(button: CalculatorButton)
    {
        if  (currentMode == .notSet || lastButtonWasMode) {
            
            return
        }
        
        
        if currentMode == .addition
        {
            savedNum += currentValueInt
        }
        else if currentMode == .subtraction{
            savedNum -= currentValueInt
        }
        else if currentMode == .multiplication{
            savedNum *= currentValueInt
        }
        else if currentMode == .division{
            savedNum /= currentValueInt
        }
        
        currentValueInt = savedNum
        updateText()
        lastButtonWasMode = true
        
    }
    
    func didPressClear(button: CalculatorButton)
    {
         currentValue = "0"
         currentMode = .notSet
         lastButtonWasMode = false
         savedNum = 0
         currentValueInt = 0
    }
}

#Preview {
    ContentView()
}
