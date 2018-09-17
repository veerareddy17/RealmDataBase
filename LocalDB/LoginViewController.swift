//
//  LoginViewController.swift
//  LocalDB
//
//  Created by veera reddy on 12/09/18.
//  Copyright © 2018 veera reddy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var popupView: UIView!
    var signinView: SignViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        popupView.backgroundColor = .gray
        self.popupView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(popupView)
        self.popupView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.popupView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.popupView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.popupView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.popupView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func removeSubView(_ sender: UIButton) {
         self.popupView.removeFromSuperview()
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
