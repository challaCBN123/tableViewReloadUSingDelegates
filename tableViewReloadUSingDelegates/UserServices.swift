//
//  UserServices.swift
//  tableViewReloadUSingDelegates
//
//  Created by Bhargava on 12/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import Foundation
import Alamofire
enum PARAMETER_ENCODING{
    static let URL_ENCODING = "URLEncoding"
    static let JSON_ENCODING = "JSONEncoding"
}
class gettingImageData:NSObject{
    static let services = gettingImageData()
   func getImagesFromUrl(baseUrl:String , serviceUrl:String,encoding:JSONEncoding,CompletionHandlers : @escaping (_ responseData:AnyObject,_ error:String)->Void){
           
               AF.request(baseUrl+serviceUrl,method: .get ,encoding: JSONEncoding.default).responseJSON { (response) in
                   //print(response.value! as Any)
                   switch response.result{
                   case .success(_):
                       if response.value != nil{
                           CompletionHandlers(response.value! as Any as AnyObject, "")
                       }
                       print("Success")
                       break
                   case .failure(_):
                       let temp:[AnyObject] = []
                       CompletionHandlers(temp as AnyObject, "\(String(describing: response.error ?? nil))")
                       print("Failure")
                       break
                   }
               }
               
           
       }
}
class dataGet:NSObject{
    func getImagesFromUrl(baseUrl:String , serviceUrl:String,encoding:JSONEncoding,CompletionHandlers : @escaping (_ responseData:AnyObject,_ error:String)->Void){
           
               AF.request(baseUrl+serviceUrl,method: .get ,encoding: JSONEncoding.default).responseJSON { (response) in
                   //print(response.value! as Any)
                   switch response.result{
                   case .success(_):
                       if response.value != nil{
                           CompletionHandlers(response.value! as Any as AnyObject, "")
                       }
                       print("Success")
                       break
                   case .failure(_):
                       let temp:[AnyObject] = []
                       CompletionHandlers(temp as AnyObject, "\(String(describing: response.error ?? nil))")
                       print("Failure")
                       break
                   }
               }
               
           
       }
}
