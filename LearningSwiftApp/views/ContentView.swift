//
//  ContentDetailView.swift
//  LearningSwiftApp
//
//  Created by Mac on 30/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var module:Module

    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    if (module.currentModule != nil) {
                        ForEach(module.currentModule!.content.lessons){lesson in
                            NavigationLink(destination:{
                                ContentDetailView().onAppear(perform: {
                                    module.getCurrentLesson(lesson.id)
                                })
                            }) {
                                ZStack(alignment: .leading) {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                        .frame(height: 66)
                                    HStack(spacing:20) {
                                        Text("\(lesson.id)")
                                            .font(.system(size: 20))
                                            .bold()
                                        VStack(alignment: .leading,spacing: 5) {
                                            Text(lesson.title)
                                                .font(.system(size: 18))
                                                .bold()
                                            Text("Duration\(lesson.duration)")
                                                .font(.caption)
                                            
                                    
                                        }
                                
                                    }.padding()
                            
                                }
                            }
                    
                        }.padding(.vertical,5)
                            .padding(.horizontal,15)
                
                    }
            
                }
            }.accentColor(.black)
        }
        .navigationBarTitle("Learn \(module.currentModule?.category ?? "")")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Module())
    }
}
