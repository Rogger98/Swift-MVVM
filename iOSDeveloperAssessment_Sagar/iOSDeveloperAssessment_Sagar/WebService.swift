//
//  WebService.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import Foundation


class WebServices {
    
    static var shared: WebServices = WebServices()
    
    
    func makeRequest<T: Codable>(route: APIRouter,type: T.Type,success: @escaping(_ result: T) -> Void,failuer: @escaping(_ networkError: String?,_ responseError: ResponseError?) -> Void) {
        let path = route.path
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = route.methodType.rawValue
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error == nil, let statusCode = response as? HTTPURLResponse {
                if let responseData = data {
                    if statusCode.statusCode == 200 {
                        do {
                            if let responseda = JSONSerialization.jsonObject(with: responseData, options: .allowFragments) {
                                print("Response \(responseda)")
                            }
                            let json = try JSONDecoder().decode(type.self, from: responseData)
                            success(json)
                        }catch {
                            print("Error Decode")
                            failuer(nil,ResponseError(rawValue: 111))
                        }
                    }
                }
            } else {
                let message = error.debugDescription
                failuer(message,nil)
            }
        }.resume()
        
    }
    
}
