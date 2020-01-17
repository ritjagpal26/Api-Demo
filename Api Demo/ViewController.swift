//
//  ViewController.swift
//  Api Demo
//
//  Created by Mac on 2020-01-17.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=aa076db80cabf4996c9703bf1126af4e")!
        
        let task  = URLSession.shared.dataTask(with: url) {(data, response , error) in
            if let error  = error {
                print(error)
            }else {
                if let urlContent = data{
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                        print(jsonResult)
//                        print(jsonResult["name"] as! String)
                        
                        if let description = ((jsonResult["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String{
                            print(description)
                        }
                        
                        

                    }catch {
                        print(error)
                    }
                }
            }
        }
        //start the task
        task.resume()
    }


}

