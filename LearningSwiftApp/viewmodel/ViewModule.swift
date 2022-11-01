//
//  ViewModule.swift
//  LearningSwiftApp
//
//  Created by Mac on 30/10/2022.
//

import Foundation

class Module: ObservableObject {
    //styles and learning modules
    @Published var Module = [LessonModel]()
    @Published var stylesData:Data?
    
    //current module in content view
    @Published var currentModule : LessonModel?
    private var currentModuleIndex = 0
    
    //current lesson content and index
    @Published var currentLesson : Lesson?
    @Published var currentLessonIndex = 0
    //current lesson explanation
    @Published var codeText = NSAttributedString()
    
    //current selected content and test selection
    @Published var currentContentSelected: Int?
    @Published var currentTestSelected: Int?
    
    //get current test and test index
    @Published var currentQuizSelected: Question?
    @Published var currentQuizIndex = 0
    
    
    
    init (){
        let moduleData = DataService.getLessonData()
        let styleData = DataService.getStyleData()
        Module = moduleData
        stylesData = styleData
    }
    
    //MARK: - get current Module and module index
    func getCurrentModule(_ moduleIndex: Int) {
        
        for index in 0 ..< Module.count {
            if (Module[index].id == moduleIndex) {
                self.currentModuleIndex = moduleIndex
                break
            }
        }
        currentModule = Module[currentModuleIndex]
    }
    
    //MARK: - get current lesson and lesson index
    func getCurrentLesson(_ lessonIndex: Int) {
        if lessonIndex < currentModule!.content.lessons.count {
            currentLessonIndex = lessonIndex
        }
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        codeText = addHtmlStyling(currentLesson!.explanation)
    }
    
    //MARK: - join the style data
    func addHtmlStyling (_ htmlString:String) -> NSAttributedString {
        var resultString = NSAttributedString();
        var data = Data()
        if(stylesData != nil){
            data.append(stylesData!)
        }
        data.append(Data(htmlString.utf8))
        
        do {
            let result = try NSAttributedString(data: data, options: [.documentType:NSAttributedString.DocumentType.html],documentAttributes: nil)
            resultString = result
        }catch{
            print(error)
        }
        
        return resultString
    }
    
    //MARK: - is there a next lesson
    func hasNextLesson() -> Bool {
        guard currentLessonIndex + 1  < currentModule!.content.lessons.count else{
            return false
        }
        return true
    }
    
    //MARK: - navigate to next lesson
    func moveToNextLesson(_ lessonId : Int) {
        if(hasNextLesson()){
            currentLessonIndex = lessonId + 1
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            codeText = addHtmlStyling(currentLesson!.explanation)
        }else {
            currentLesson = nil
            currentLessonIndex = 0
        }
    }
    
    //MARK: - current test and test index
    func  getCurrentQuiz (_ moduleId:Int) {
        getCurrentModule(moduleId);
        //quiz index
        currentQuizIndex = 0
        //get current quiz index
        if(currentModule?.test.questions.count ?? 0 > 0){
            currentQuizSelected =  currentModule!.test.questions[currentQuizIndex]
            codeText = addHtmlStyling(currentQuizSelected!.content)
        }
    }
}
