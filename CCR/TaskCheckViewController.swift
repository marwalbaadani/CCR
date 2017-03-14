//
//  TaskCheckViewController.swift
//  CCR
//
//  Created by Erica Millado on 2/22/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit

class TaskCheckViewController: UIViewController {

    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var currentGoalLabel: UILabel!
    
    let store = DataStore.sharedInstance
    
    @IBAction func yesButtonTapped(_ sender: Any) {
        print("yes button tapped")
        //take the current task and duplicate it in the array
        let oldTaskDescription = self.store.tasks.last?.description ?? ""
        print(oldTaskDescription)
        let anotherNewTask = Task()
        anotherNewTask.description = "\(oldTaskDescription)"
        anotherNewTask.rating = "no rating"
        self.store.saveData(task: anotherNewTask)
        print("the array now has \(self.store.tasks.count)")
        self.store.userIsOnBreak = false
        self.performSegue(withIdentifier: "toCountDownVC", sender: self)
    }
    
    @IBAction func noButtonTapped(_ sender: Any) {
        print("no button tapped")
        self.showSetGoalVC()
        self.store.userIsOnBreak = false
        self.performSegue(withIdentifier: "toBrandNewTask", sender: self)
    }
    
    //user clicked "no" and needs to set a new task
    func showSetGoalVC() {
        let goalCheckVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "newTaskID") as! SetNewTaskViewController
        self.present(goalCheckVC, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        noButton.layer.cornerRadius = 8
        yesButton.layer.borderColor = Constants.red.cgColor
        yesButton.layer.borderWidth = 1
        yesButton.layer.cornerRadius = 8
        currentGoalLabel.text = self.store.tasks.last?.description
        currentGoalLabel.layer.cornerRadius = 3
    }

}
