//
//  WebService.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import Foundation


class WebServices {
    
    static var shared: WebServices = WebServices()
    
    /// make any api request and get decoded model data
    func makeRequest<T: Codable>(route: APIRouter,type: T.Type,success: @escaping(_ result: T) -> Void,failuer: @escaping(_ networkError: String?,_ responseError: ResponseErrorDetails?) -> Void) {
        let path = route.path
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = route.methodType.rawValue
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error == nil{
                if let responseData = data {
                    
                    do {
                        if let responseda = try? JSONSerialization.jsonObject(with: responseData, options: .allowFragments) {
                            print(" ✅ Response \(responseda)")
                        }
                        let json = try JSONDecoder().decode(type.self, from: responseData)
                        success(json)
                    }catch {
                        if let errorDetails = try? JSONDecoder().decode(ResponseErrorDetails.self, from: responseData) {
                            failuer(nil,errorDetails)
                        } else {
                            failuer(error.localizedDescription,nil)
                        }
                    }
                    
                }
            } else {
                let message = error?.localizedDescription ?? ""
                if message == "cancelled" {
                    return
                } else {
                    print(" ❌ Error ")
                }
                failuer(message,nil)
            }
            
        }.resume()
        
    }
    
    func getAPICall<T: Codable>(path: String,type: T.Type,success: @escaping(_ result: T) -> Void,failuer: @escaping(_ networkError: String?,_ responseError: ResponseErrorDetails?) -> Void) {
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error == nil {
                if let responseData = data {
                        do {
                            if let responseda = try? JSONSerialization.jsonObject(with: responseData, options: .allowFragments) {
                                print(" ✅ Response \(responseda)")
                            }
                            let json = try JSONDecoder().decode(type.self, from: responseData)
                            success(json)
                            return
                        }catch {
                            if let errorDetails = try? JSONDecoder().decode(ResponseErrorDetails.self, from: responseData) {
                                failuer(nil,errorDetails)
                            } else {
                                failuer(error.localizedDescription,nil)
                            }
                        }
                }
            } else {
                let message = error?.localizedDescription ?? ""
                if message == "cancelled" {
                    return
                } else {
                    print(" ❌ Error ")
                }
                failuer(message,nil)
            }
            
        }.resume()
        
    }
    
    /// this will cancel all api requests
    func cancellAllRequest() {
        URLSession.shared.getAllTasks { (tasks) in
            for task in tasks {
                task.cancel()
            }
        }
    }
}
