//
//  dataservice.swift
//  LearningSwiftApp
//
//  Created by Mac on 30/10/2022.
//

import Foundation

class DataService {
    //MARK: -get json data from data file
    static func getLessonData() -> [LessonModel] {
        let pathString = Bundle.main.path(forResource: "data", ofType: "json")
        
        guard pathString != nil else{
            return [LessonModel]()
        }
        
        let url = URL(filePath: pathString!)
        do {
            
            let data = try Data(contentsOf: url)
            let jsonDecoder = JSONDecoder()
            
            do {
                let fileData = try jsonDecoder.decode([LessonModel].self, from: data)
                return fileData
            }catch{
                print(error)
                print("could not decode json")
            }
            
        }catch{
            print(error)
            print("could not read data from path url")
        }
        
        return [LessonModel]()
    }
 
    //MARK: - get html css styles from styles file
    static func getStyleData () -> Data {
        let pathString = Bundle.main.url(forResource: "style", withExtension: "html")
        
        guard pathString != nil else {
            return Data()
        }
        
        do {
            let data = try Data(contentsOf: pathString!)
            print(data)
            return data
        }catch {
            print(error)
        }
        
        return Data()
    }
}
