//
//  SideMenuViewController.swift
//  LocalDB
//
//  Created by veera reddy on 12/09/18.
//  Copyright © 2018 veera reddy. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController {

    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    var isOpend = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.viewTapped))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.viewTapped))
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(panGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func viewTapped() {
        if self.leadingConstraint.constant == 0{
            self.leadingConstraint.constant = -240
            return
        }
        self.leadingConstraint.constant = 0
    }
    @IBAction func clickOnSideMenu(_ sender: UIButton) {
        if isOpend {
            UIView.animate(withDuration: 10) {
                self.isOpend = false
                self.leadingConstraint.constant = -240
            }
        } else {
            UIView.animate(withDuration: 10) {
                self.isOpend = true
                self.leadingConstraint.constant = 0
            }
        }
       
    }
    
    @IBAction func clickOnRefresh(_ sender: UIBarButtonItem) {
        if self.isOpend {
            UIView.animate(withDuration: 10, animations: {
                self.leadingConstraint.constant = -240
            }) { (isOpend) in
                self.isOpend = false
            }
        } else {
            UIView.animate(withDuration: 10, animations: {
                self.leadingConstraint.constant = 0
            }) { (isOpend) in
                self.isOpend = true
            }
        }
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
