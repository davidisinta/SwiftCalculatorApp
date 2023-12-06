//
//  TotalText.swift
//  project1
//
//  Created by David Isinta Nyakawa on 12/22/23.
//

import SwiftUI

struct TotalText: View {
    
    var value: String = "0"
    var body: some View {
        
        
        
        Text(value)
                .font(.system(size: 45))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.white)
                .padding()
                .lineLimit(1)
    }
}

#Preview {
    TotalText()
        .background(.black)
}
