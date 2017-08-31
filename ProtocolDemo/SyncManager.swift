//
//  SyncManager.swift
//  ProtocolDemo
//
//  Created by Pritesh Pethani on 30/05/17.
//  Copyright © 2017 Pritesh Pethani. All rights reserved.
//

import Foundation


import Alamofire


protocol SyncManagerDelegate {
    func syncSuccess(responseObject:Any,tag:Int)
    func syncFailure(error:NSError,tag:Int)

}

class SyncManager: NSObject {
    
    var delegate: SyncManagerDelegate?
    
    func webServiceCall(url:String,params:[String:Any],tag:Int){
        print("Webservice call Methods")
        
//        let params1:Parameters = params
//        print("Parameter :",params1)
        //Alamofire.request(url1!, method: .post).validate().responseJSON
        
        Alamofire.request(url, method: .post, parameters: params).validate().responseJSON
         { response in
            switch response.result {
            case .success:
             //   let json = IXON(value)
             //   print("JSON: \(value)")
              
//                print(response.request ?? "123")  // original URL request
//                print(response.response ?? "123") // HTTP URL response
//                print(response.data ?? "123")     // server data
//                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    self.delegate?.syncSuccess(responseObject: JSON, tag: tag)
//                    print("JSON: \(JSON)")
                }
                
                
                
            case .failure(let error):
                self.delegate?.syncSuccess(responseObject: error, tag: tag)
                print(error)
            }
        }
        
        
    }
    
    func callAPI()
    {
        //        Alamofire.request("https://httpbin.org/get").responseJSON { (response) in
        //            print(response.request)  // original URL request
        //            print(response.response) // HTTP URL response
        //            print(response.data)     // server data
        //            print(response.result)   // result of response serialization
        //
        //            if let JSON = response.result.value {
        //                print("JSON: \(JSON)")
        //            }
        //        }
        
        
        // Response Handler - Unserialized Response
        
        //        Alamofire.request("https://maps.googleapis.com/maps/api/geocode/json?address=ahmedabad").response { (response) in
        //            print("response  \(response)")
        //        }
        
        
        // Response Data Handler - Serialized into Data
        
        /* Alamofire.request("https://maps.googleapis.com/maps/api/geocode/json?address=ahmedabad").responseData { (responce) in
         print("responce status is \(responce.result)")
         print("response is \(responce)")
         
         debugPrint("all responce information \(responce)")
         
         if let data = responce.result.value, let str = String(data: data, encoding: .utf8)
         {
         print("response in string \(str)")
         }
         
         
         
         //            do
         //            {
         //                let json = try JSONSerialization.data(withJSONObject: responce.result.value, options: [])
         //                print("converted json is \(json)")
         //            }
         //            catch
         //            {
         //                print("can not covert data to json")
         //            }
         
         } */
        
        
        // Response String Handler - Serialized into String
        
        /*  Alamofire.request("https://maps.googleapis.com/maps/api/geocode/json?address=ahmedabad").responseString { (response) in
         print("status \(response.result.isSuccess)")
         print("response \(response.result.value)")
         } */
        
        
        // Response JSON Handler - Serialized into Any
        /* Alamofire.request("https://maps.googleapis.com/maps/api/geocode/json?address=ahmedabad").responseJSON { (response) in
         print("status \(response.result)")
         print("json is \(response.result.value)")
         
         if let json = response.result.value
         {
         print("unwrrapred json is \(json)")
         }
         } */
        
        
        // Response PropertyList (plist) Handler - Serialized into Any
        /* Alamofire.request("https://maps.googleapis.com/maps/api/geocode/json?address=ahmedabad").responsePropertyList { (response) in
         print("status is \(response.result)")
         print("responce is \(response.result.value)")
         } */
        
        
        //Chained Response Handlers
        
        /* Alamofire.request("https://maps.googleapis.com/maps/api/geocode/json?address=ahmedabad").responseString { (response) in
         print("response \(response.result.isSuccess)")
         print("response in string \(response.result.value)")
         }
         
         .responseJSON { (response) in
         print("response is \(response.result.isSuccess)")
         print("response in json \(response.result.value)")
         } */
        
        
        // json with success and failure
        /*Alamofire.request("https://maps.googleapis.com/maps/api/geocode/json?address=ahmedabad").responseJSON { (response) in
         
         switch response.result
         {
         case .success:
         print("response is \(response.result.value)")
         
         if let json = response.result.value
         {
         print("unwrraped json is \(json)")
         }
         
         case .failure(let error):
         print("error is \(response.result.error?.localizedDescription)")
         print("error is \(error)")
         }
         } */
        
        
        //The Alamofire.request method parameter defaults to .get.
        //Use Post Methods
        /*Alamofire.request("http://www.winken2share.com/api/Event/GetEventCategories", method: .post).responseJSON { (response) in
         print("status is \(response.result) data is \(response.result.value)")
         } */
        
        //Parameters Encoding
        /*let params = ["data" : ["username" : "meet.magespider",
         "password" : "mage",
         "device_token" : "11223",
         "device_type" : "1"]]
         
         Alamofire.request("http:www.winken2share.com/api/Registration/CheckLogin", method: .post, parameters: params, encoding: JSONEncoding.default) .responseJSON { (response) in
         print("status is \(response.result) data is \(response.result.value)")
         } */
    }
    
    
    //    func callApiWithHTTPHeaders()
    //    {
    //        if Connectivity.isConnectedToInternet
    //        {
    //            let url = "https://prodapi.bridgeeat.com:5568/api/v1/user_profile/mittal.magespider@gmail.com"
    //
    //            let header:HTTPHeaders = ["X-AUTH-EMAIL" : "mittal.magespider@gmail.com",
    //                                      "X-AUTH-TOKEN" : "98081b035ad0f7020ac1d47d8900682d"]
    //
    //            Alamofire.request(url, headers: header).responseJSON(completionHandler: { (response) in
    //                print("response \(response)")
    //            })
    //        }
    //    }
    
    
    func downloadImage()
    {
        let destination : DownloadRequest.DownloadFileDestination = {tempUrl,responseURL in
            
            print("tempUrl is \(tempUrl)  responseURL is \(responseURL)")
            let docURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = docURL.appendingPathComponent("myDownloadImg.png")
            
            return (fileURL, [.removePreviousFile,.createIntermediateDirectories])
        }
        
        
        /// A closure executed once a download request has successfully completed in order to determine where to move the
        /// temporary file written to during the download process. The closure takes two arguments: the temporary file URL
        /// and the URL response, and returns a two arguments: the file URL where the temporary file should be moved and
        /// the options defining how the file should be moved.
        
        
        
        
        Alamofire.download("http://www.winken2share.com/upload/3437-help_fill_green.png", to: destination).responseJSON { (response) in
            print("status is \(response.result) data is \(response.result.value)")
        }
        
        Alamofire.download("http://www.winken2share.com/upload/3437-help_fill_green.png", to: destination) .response { (response) in
            print("response is \(response)")
            
            if response.error == nil, let imagePath = response.destinationURL?.path {
                let image = UIImage(contentsOfFile: imagePath)
                print("fgb jyj juy7 uyyi yui uu u8iu8i")
            }
        }
        
        
        
        Alamofire.download("http://www.winken2share.com/upload/3437-help_fill_green.png", to: destination).downloadProgress { (progess1) in
            print("Download Progress: \(progess1.fractionCompleted)")
            }.responseData { (response) in
                if let data = response.result.value
                {
                    let img = UIImage(data: data)
                }
        }
        
    }
    
    func uploadImageToServer()
    {
        let url = Bundle.main.url(forResource: "images copy", withExtension: "jpg")
        
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(url!, withName: "image")
        },
            to: "http://demo.magespider.com/victrips/upload/upload1.php",
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        debugPrint(response)
                    }
                case .failure(let encodingError):
                    print(encodingError)
                }
        }
        )
        
        //        Alamofire.upload(fileURL!, to: "http://mores-dev.com.tw/52Eat/webservice/multi_upload.php").responseJSON { (response) in
        //            debugPrint(response)
        //
        //            print("resulits is \(response.result)")
        //
        //            if let json = response.result.value
        //            {
        //                print("json \(json)")
        //            }
        //        }
        
        
    }
    
}
