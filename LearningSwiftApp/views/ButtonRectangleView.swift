//
//  ButtonRectangleView.swift
//  LearningSwiftApp
//
//  Created by Mac on 01/11/2022.
//

import SwiftUI

struct ButtonRectangleView: View {
    var color:Color
    var frame:CGFloat
    var cornerRadius:CGFloat
    var shadowRadius:CGFloat
    var body: some View {
        Rectangle()
            .foregroundColor(color)
            .frame(height:frame)
            .cornerRadius(cornerRadius)
            .shadow(radius: shadowRadius)
    }
}

struct ButtonRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonRectangleView(color:Color.white,frame: 48,cornerRadius: 5,shadowRadius: 5)
    }
}
