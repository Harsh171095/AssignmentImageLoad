    //
    //  Webservice.swift
    //  AssignmentImageLoad
    //
    //  Created by admin on 14/04/24.
    //

import Foundation

typealias JSON = [String:Any]

class Webservice {
    
    static func getPostList(success: @escaping (([PostModel])->()), failure: @escaping ((String)->())) {
        
        var request = URLRequest(url: URL(string: "https://acharyaprashant.org/api/v2/content/misc/media-coverages?limit=100")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                failure(error?.localizedDescription ?? "")
                return
            }
            do {
                let decoder = JSONDecoder()
                let people = try decoder.decode([PostModel].self, from: data)
                success(people)
            } catch(let error) {
                print(error)
                failure(error.localizedDescription)
            }
        }
        
        task.resume()
        
    }
}
