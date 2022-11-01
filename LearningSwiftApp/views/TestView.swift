//
//  TestView.swift
//  LearningSwiftApp
//
//  Created by Mac on 01/11/2022.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: Module
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    if(model.currentModule != nil) {
                        VStack {
                            Text("Question \((model.currentQuizSelected?.id ?? 0) + 1 ) of \(model.currentModule?.test.questions.count ?? 0)")
                            CodeTextView()
                        }
                       
                    }else {
                        ProgressView()
                    }
                }
            }.navigationBarTitle("\(model.currentModule?.category ?? "") Test")
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView().environmentObject(Module())
    }
}
