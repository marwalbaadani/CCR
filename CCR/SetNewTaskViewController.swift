//
//  SetNewTaskViewController.swift
//  CCR
//
//  Created by Erica Millado on 2/23/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit

class SetNewTaskViewController: UIViewController {

    @IBOutlet weak var newTaskTextField: UITextField!
    @IBOutlet weak var addNewTaskButton: UIButton!
    
    let store = DataStore.sharedInstance
    
    @IBAction func addNewTaskTapped(_ sender: Any) {
        
        if newTaskTextField.text == "" {
            let noTaskAlert = UIAlertController(title: "Missing a Task", message: "Enter a task", preferredStyle: .alert)
            
            let titleFont:[String : AnyObject] = [ NSFontAttributeName : UIFont(name: "AmericanTypewriter", size: 18)! ]
            let messageFont:[String : AnyObject] = [ NSFontAttributeName : UIFont(name: "AmericanTypewriter", size: 14)! ]
            let attributedTitle = NSMutableAttributedString(string: "Missing a New Task", attributes: titleFont)
            let attributedMessage = NSMutableAttributedString(string: "Enter a task", attributes: messageFont)
            noTaskAlert.setValue(attributedTitle, forKey: "attributedTitle")
            noTaskAlert.setValue(attributedMessage, forKey: "attributedMessage")
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            noTaskAlert.addAction(okAction)
            present(noTaskAlert, animated: true, completion: nil)
        } else {
            let newTask = Task()
            if let unwrappedText = newTaskTextField.text {
                newTask.description = unwrappedText
            }
            self.store.tasks.append(newTask)
            print("a brand new task was added")
            
            //TODO: - this removing of superview is taking me to a blank screen
            self.view.removeFromSuperview()
        }
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNewTaskButton.layer.cornerRadius = 8
        addNewTaskButton.layer.borderColor = UIColor.white.cgColor
        addNewTaskButton.layer.borderWidth = 2
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
