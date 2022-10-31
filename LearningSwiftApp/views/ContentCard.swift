//
//  ContentCard.swift
//  LearningSwiftApp
//
//  Created by Mac on 30/10/2022.
//

import SwiftUI

struct ContentCard: View {
    
    var image: String
    var title : String
    var description : String
    var lessonNumber : String
    var time : String
    var body: some View {
        ZStack {
            Rectangle()
                .aspectRatio(CGSize(width: 225, height: 135), contentMode: .fit)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 10)
            HStack(spacing:15) {
                Image(image)
                    .resizable()
                    .frame(width: 114,height: 114)
                    .clipShape(Circle())
                VStack(alignment: .leading,spacing: 10) {
                    VStack(alignment:.leading,spacing: 10) {
                        Text(title)
                            .font(.title2)
                            .bold()
                        Text(description)
                    }.padding(.trailing,5)
                    HStack(spacing:10){
                        Image(systemName: "character.book.closed.fill")
                            .resizable()
                            .frame(width: 15,height: 15)
                        Text(lessonNumber)
                            .font(.system(size: 15))
                        Image(systemName: "clock.fill")
                            .resizable()
                            .frame(width: 15,height: 15)
                        Text(time)
                            .font(.system(size: 15))
                    }.padding(.top,20)
                }
            }
        }.padding()
    }
}

struct ContentCard_Previews: PreviewProvider {
    static var previews: some View {
        ContentCard(image: "swift", title: "Learn Swift", description: "This is a test for the this and that and also that",
                    lessonNumber: "10 Lesson", time: "3 Hours")
    }
}
