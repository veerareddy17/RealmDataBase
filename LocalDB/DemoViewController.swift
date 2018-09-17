//
//  DemoViewController.swift
//  LocalDB
//
//  Created by veera reddy on 12/09/18.
//  Copyright © 2018 veera reddy. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let eta = futureTime(timeIntervel: 3600 * 5)
        print(eta)
    }
    
    func futureTime(timeIntervel:Int) -> String {
        let currentDate = Date()
        let dateFromatter = DateFormatter()
        dateFromatter.dateFormat = "hh:mm a"
        dateFromatter.timeZone = TimeZone(abbreviation: "Local")
        print(dateFromatter.string(from: currentDate))
        let futureDate = Date(timeInterval: TimeInterval(timeIntervel), since: currentDate)
        return dateFromatter.string(from: futureDate)
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
