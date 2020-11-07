//
//  ParthenoKit.swift
//  ParthenoKit
//
//  Created by Ignazio Finizio on 19/11/2019.
//  Copyright © 2019 Ignazio Finizio. All rights reserved.
//

import UIKit

public class ParthenoKit: NSObject {
    
    public func write(team: String, tag: String, key: String, value: Any, completion: @escaping (Bool)->Void)->Bool{
        var result = true
        
        let myUrl = "https://parthenope.testride.eu/wsfoundation.asmx/write"
        let parameters = ["gruppo" : team, "sottogruppo" : tag, "chiave" : key , "valore" : value] as [String : Any]
        guard let url = URL(string: myUrl) else {return false}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options:[]) else {return false}
        request.httpBody = httpBody
        let session = URLSession.shared
        session.dataTask(with: request) {(data, response, error) in
            if let data = data {
                do {
                    let json1: [String : Any]? = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                    
                    result =  json1!["d"] as! Bool
                    
                    completion(result)
                    
                } catch {
                    result = false
                }
            }
        }.resume()
        return result
    }
    
    public func read(team: String, tag: String, key: String, completion: @escaping (Any)->Void)->Bool{
        var result = ""
        var ret = true
        
        let myUrl = "https://parthenope.testride.eu/wsfoundation.asmx/read"
        
        let parameters = ["gruppo" : team, "sottogruppo" : tag, "chiave" : key] as [String : Any]
        guard let url = URL(string: myUrl) else {return false}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options:[]) else {return false}
        request.httpBody = httpBody
        let session = URLSession.shared
        session.dataTask(with: request) {(data, response, error) in
            if let data = data {
                do {
                    let json1: [String : Any]? = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                    
                    result =  json1!["d"] as! String
                    if result.count>=2 {
                        if (result.first=="\"")&&(result.last == "\""){
                            result.removeFirst()
                            result.removeLast()
                        }
                    }
                    completion(result)
                    
                } catch {
                    ret=false
                }
            }
        }.resume()
        return ret
    }
    
    
    func sendEmail(team:  String, imageView:  UIImageView, fileName: String, fromEmail: String, toEmail: String, subjectEmail: String, bodyEmail: String)
      {
          let url = URL(string: "https://parthenope.testride.eu/upload.ashx")
        
          var image_data: Data?
          var mimetype = ""
          
          let request = NSMutableURLRequest(url: url!)
          request.httpMethod = "POST"
          let boundary = "Boundary-\(UUID().uuidString)"
          request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
          if (imageView.image == nil)
          {
              return
          }
          if(fileName.hasSuffix(".jpeg")){
              image_data = imageView.image!.jpegData(compressionQuality: 0.8)
              mimetype = "image/jpeg"
          } else if(fileName.hasSuffix("jpg")){
              image_data = imageView.image!.jpegData(compressionQuality: 0.8)
              mimetype = "image/jpeg"
          } else if(fileName.hasSuffix(".png")){
              image_data = imageView.image!.pngData()
              mimetype = "image/png"
          }
          if(image_data == nil)
          {
              return
          }
          let body = NSMutableData()
          
          body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
          body.append("Content-Disposition:form-data; name=\"team\"\r\n\r\n".data(using: String.Encoding.utf8)!)
          body.append("\(team)\r\n".data(using: String.Encoding.utf8)!)
          
          body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
          body.append("Content-Disposition:form-data; name=\"toemail\"\r\n\r\n".data(using: String.Encoding.utf8)!)
          body.append("\(toEmail)\r\n".data(using: String.Encoding.utf8)!)
          
          body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
          body.append("Content-Disposition:form-data; name=\"fromemail\"\r\n\r\n".data(using: String.Encoding.utf8)!)
          body.append("\(fromEmail)\r\n".data(using: String.Encoding.utf8)!)
          
          body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
          body.append("Content-Disposition:form-data; name=\"subjectemail\"\r\n\r\n".data(using: String.Encoding.utf8)!)
          body.append("\(subjectEmail)\r\n".data(using: String.Encoding.utf8)!)
          
          body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
          body.append("Content-Disposition:form-data; name=\"bodyemail\"\r\n\r\n".data(using: String.Encoding.utf8)!)
          body.append("\(bodyEmail)\r\n".data(using: String.Encoding.utf8)!)
          
          body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
          body.append("Content-Disposition:form-data; name=\"file\"; filename=\"\(fileName)\"\r\n".data(using: String.Encoding.utf8)!)
          body.append("Content-Type: \(mimetype)\r\n\r\n".data(using: String.Encoding.utf8)!)
          body.append(image_data!)
          body.append("\r\n".data(using: String.Encoding.utf8)!)
          body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8)!)
          request.httpBody = body as Data
          let session = URLSession.shared
          let task = session.dataTask(with: request as URLRequest, completionHandler: {
              (
              data, response, error) in

              guard ((data) != nil), let _:URLResponse = response, error == nil else {
                  print("error")
                  return
              }
              if let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
              {
                  print(dataString)
              }
          })
          task.resume()
      }
}

