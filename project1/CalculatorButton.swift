//
//  CalculatorButton.swift
//  project1
//
//  Created by David Isinta Nyakawa on 12/29/23.
//

import SwiftUI

struct CalculatorButton: View {
    
    var buttonText: String = "1"
    var buttonColor: Color = Color(hue: 1.0, saturation: 0.093, brightness: 0.346)
    
    var action: (CalculatorButton) -> Void  = {_ in }
    var mode: CalculatorMode = .notSet
    
    
    
   
    
    
    var body: some View {
        
        Button{
            action(self)
           
        }
    label:{
        
        Text(buttonText)
            .font(.largeTitle)
            .frame(width: 70, height: 70, alignment: .center)
            .background(buttonColor)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 50))
        
    }
       
    }
    
    
    
    
}

#Preview {
    CalculatorButton()
}
