//
//  ViewController.swift
//  LocalDB
//
//  Created by veera reddy on 11/09/18.
//  Copyright © 2018 veera reddy. All rights reserved.
//

import UIKit
import RealmSwift
class Model:  Object {
    @objc dynamic var address  = ""
}
class ViewController: UIViewController {
    var txtFld:UITextField!
    var model:Results<Model>!
    let realm = try! Realm()
    @IBOutlet weak var tblVC: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblVC.delegate = self
        self.tblVC.dataSource = self
        self.fetchData()
        self.tblVC.reloadData()
    }
    func fetchData() {
        model = realm.objects(Model.self)
    }
    
    func save(object: Model){
        try! realm.write {
            realm.add(object)
        }
    }
    
    @IBAction func showUIAlert(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add Address", message: "", preferredStyle: .alert)
        let send = UIAlertAction(title: "Add Item", style: .default) { (action) in
           let user = Model()
            user.address = self.txtFld.text!
            self.save(object: user)
            self.fetchData()
            self.tblVC.reloadData()
        }
        alert.addTextField { (textField) in
//            let heightConstraint = NSLayoutConstraint(item: textField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
//            textField.addConstraint(heightConstraint)
            textField.addTarget(self, action: #selector(self.textFieldDidChange), for: UIControlEvents.editingChanged)
            self.txtFld = textField
        }
        alert.addAction(send)
        self.present(alert, animated: true, completion: nil)
    }
    @objc func textFieldDidChange() {
        print(self.txtFld.text ?? "")
    }
}
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let modelCell = tblVC.dequeueReusableCell(withIdentifier: "model", for: indexPath) as? ModelTableViewCell
        modelCell?.address.text = "\(model[indexPath.row].address)"
        return modelCell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //         let item = model[indexPath.row]
        //            try! realm.write {
        //                realm.delete(item)
        //            }
        self.tblVC.reloadData()
    }
    
    //    private func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: IndexPath) {
    //        if editingStyle == .delete {
    //            let item = model[indexPath.row]
    //            try! realm.write {
    //                realm.delete(item)
    //            }
    //            tableView.reloadData()
    //        }
    //    }
    //    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    //
    //        // action one
    //        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: { (action, indexPath) in
    //            print("Edit tapped")
    //        })
    //        editAction.backgroundColor = UIColor.blue
    //
    //        // action two
    //        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
    //            print("Delete tapped")
    //        })
    //        deleteAction.backgroundColor = UIColor.red
    //
    //        return [editAction, deleteAction]
    //    }
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title:  "Edit", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            let updateItem = self.model[indexPath.row]
            let alert = UIAlertController(title: "Edit", message: "", preferredStyle: .alert)
            let send = UIAlertAction(title: "Add Item", style: .default) { (action) in
            let updateItem = self.model[indexPath.row]
                try! self.realm.write {
                    updateItem.address = self.txtFld.text!
                }
                self.tblVC.reloadData()
            }
            alert.addTextField { (textField) in
//                let heightConstraint = NSLayoutConstraint(item: textField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
//                textField.addConstraint(heightConstraint)
                textField.addTarget(self, action: #selector(self.textFieldDidChange), for: UIControlEvents.editingChanged)
                self.txtFld = textField
            }
            alert.addAction(send)
            self.present(alert, animated: true, completion: nil)
        })
        editAction.backgroundColor = .blue
        return UISwipeActionsConfiguration(actions: [editAction])
    }
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title:  "Delete", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print(self.model[indexPath.row])
            try! self.realm.write {
                self.realm.delete(self.model[indexPath.row])
            }
            self.tblVC.reloadData()
        })
        deleteAction.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

