//
//  ContentDetailView.swift
//  LearningSwiftApp
//
//  Created by Mac on 31/10/2022.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model : Module
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoURL  + ( lesson?.video ?? "" ))
        
        VStack {
            if(url != nil){
                VideoPlayer(player: AVPlayer(url: url!) )
                    .cornerRadius(5)
            }
            CodeTextView()
            if(model.hasNextLesson()){
                Button(action: {
                    model.moveToNextLesson(lesson!.id)
                }) {
                    ZStack {
                        ButtonRectangleView(color: Color.green, frame: 48, cornerRadius:10, shadowRadius: 5)
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex+1].title)")
                            .font(.system(size: 20,weight: .bold))
                            .foregroundColor(.white)
                    }
                }
            }else
            {
                Button(action: {
                    model.currentContentSelected = nil
                }) {
                    ZStack {
                        ButtonRectangleView(color: Color.green, frame: 48, cornerRadius:10, shadowRadius: 5)
                        Text("Complete")
                            .font(.system(size: 20,weight: .bold))
                            .foregroundColor(.white)
                    }
                }
            }
        }.padding()
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView().environmentObject(Module())
    }
}
