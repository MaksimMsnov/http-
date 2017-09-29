//
//  ViewController.swift
//  http-
//
//  Created by Максим on 30.09.2017.
//  Copyright © 2017 Максим. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let myUrl = URL(string: "http://www.swiftdeveloperblog.com/http-post-example-script/");
        
        var request = URLRequest(url:myUrl!)
        
        request.httpMethod = "POST"// Compose a query string
        
        let postString = "firstName=James&lastName=Bond";
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error != nil
            {
                print("error=\(error)")
                return
            }
            
            // You can print out response object
            print("response = \(response)")
            
            //Let's convert response sent from a server side script to a NSDictionary object:
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                if let parseJSON = json {
                    
                    // Now we can access value of First Name by its key
                    let firstNameValue = parseJSON["firstName"] as? String
                    print("firstNameValue: \(firstNameValue)")
                }
            } catch {
                print(error)
            }
        }
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

