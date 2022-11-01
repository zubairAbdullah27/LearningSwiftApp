//
//  ContentView.swift
//  LearningSwiftApp
//
//  Created by Mac on 30/10/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model : Module
    @State var navigationSelectedIndex:Int?
    var body: some View {
        
        NavigationView{
            
            ScrollView {
                
                LazyVStack {
                    ForEach(model.Module){ module in
                        NavigationLink(
                            destination:
                                ContentView()
                                    .onAppear(perform: {
                                        model.getCurrentModule(module.id)
                            }),
                            tag: module.id,
                            selection: $model.currentContentSelected
                            ,
                            label : {
                            ContentCard(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, lessonNumber: "\(module.content.lessons.count) Lesson", time: module.content.time)
                        })
                        NavigationLink(destination:
                            TestView().onAppear(perform: {
                            model.getCurrentQuiz(module.id)
                        })
                        ,
                                       tag: module.id,
                                       selection: $model.currentTestSelected
                        , label: {
                            ContentCard(image: module.test.image, title: "Learn \(module.category)", description: module.test.description, lessonNumber: "\(module.test.questions.count) Test", time: module.test.time)
                        })
                    }
                }.accentColor(.black)
            }
        }
        .navigationViewStyle(.stack)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(Module())
    }
}
