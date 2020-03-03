//
//  ViewController.swift
//  ProtocolDemo
//
//  Created by Pritesh Pethani on 30/05/17.
//  Copyright © 2017 Pritesh Pethani. All rights reserved.
//

import UIKit

class ViewController: UIViewController,SyncManagerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let completeURL = NSString(format:"%@%@", "http://demo.magespider.com/doc99/api/","Registration/CheckLogin") as String
        
//        let params = [
//            "email" : "meet.magespider@gmail.com",
//            "password" : "magespider",
//            "device_token":"56f1s",
//            "device_type":"1",
//            "lang_type":"1"
//        ] as [String:Any]
//        
//        let finalParams = [
//            "data" : params
//        ] as [String: Any]
        
        let params = ["data" : ["username" : "meet.magespider",
                                "password" : "mage",
                                "device_token" : "11223",
                                "device_type" : "1"]]
        
      //  print("Login API Parameter :",finalParams)
        print("Login API URL :",completeURL)
        
        let sampleProtocol:SyncManager = SyncManager()
        sampleProtocol.delegate = self
        sampleProtocol.webServiceCall(url:completeURL , params: params, tag: 1001)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func syncSuccess(responseObject: Any, tag: Int) {
        switch tag {
        case 1001:
            let resultDict = responseObject as! NSDictionary;
            print("Login Response  : \(resultDict)")
            
            if resultDict.value(forKey: "status") as! String == "1"{
            }
            else if resultDict.value(forKey: "status") as! String == "0"{
            }
            else if resultDict.value(forKey: "status") as! String == "3"{
            }
            
//            SVProgressHUD.dismiss()
            break
            
            default:
            break
        }
        
    }

    func syncFailure(error: NSError, tag: Int) {
        switch tag {
        case 1001:
//            SVProgressHUD.dismiss()
            break
            
        default:
            break
            
        }
        print("syncFailure Error : ",error.localizedDescription)
    }
    

}

