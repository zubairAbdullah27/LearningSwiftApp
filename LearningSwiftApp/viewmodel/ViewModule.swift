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
    @Published var currentLessonExplanation = NSAttributedString()
    
    //current selected content and test
    @Published var currentContentSelected: Int?
    
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
        currentLessonExplanation = getCurrentLessonHTML(currentLesson!.explanation)
    }
    
    //MARK: - join the style data
    func getCurrentLessonHTML (_ htmlString:String) -> NSAttributedString {
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
            currentLessonExplanation = getCurrentLessonHTML(currentLesson!.explanation)
        }else {
            currentLesson = nil
            currentLessonIndex = 0
        }
    }
}
