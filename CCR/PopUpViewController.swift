//
//  PopUpViewController.swift
//  CCR
//
//  Created by Erica Millado on 2/18/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit
import Cosmos

class PopUpViewController: UIViewController {
    
    @IBOutlet weak var takeBreakLabel: UIButton!
    @IBOutlet weak var starringView: CosmosView!
    
    let store = DataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        takeBreakLabel.layer.borderColor = Constants.red.cgColor
        takeBreakLabel.layer.borderWidth = 1
        takeBreakLabel.layer.cornerRadius = 8
        showAnimate()
        
        starringView.didFinishTouchingCosmos = { rating in
            print("The user chose a \(rating) rating")

            switch rating {
            case 5:
//                self.store.tasks.last?.ratingDouble = rating
//                print("this is the last task's ratingDouble: \(self.store.tasks.last?.ratingDouble)")
                self.store.tasks.last?.ratingString = "🌟🌟🌟🌟🌟"
                self.store.saveData()
            case 2:
//                self.store.tasks.last?.ratingDouble = rating
                self.store.tasks.last?.ratingString = "🌟🌟"
                self.store.saveData()
            case 3:
//                self.store.tasks.last?.ratingDouble = rating
                self.store.tasks.last?.ratingString = "🌟🌟🌟"
                self.store.saveData()
            case 4:
//                self.store.tasks.last?.ratingDouble = rating
                self.store.tasks.last?.ratingString = "🌟🌟🌟🌟"
                self.store.saveData()
            case 1:
//                self.store.tasks.last?.ratingDouble = rating
                self.store.tasks.last?.ratingString = "🌟"
                self.store.saveData()
            default:
                self.store.tasks.last?.ratingString = "no rating yet"
                self.store.saveData()
            }
            print("array count of rated tasks for this current goal is \(self.store.tasks.count)\n")
        }
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        removeAnimate()
    }

    func showAnimate() {
        //makes the view bigger
        self.view.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        //gets smaller
        UIView.animate(withDuration: 0.25) {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
        }
    }
    
    func removeAnimate() {
        UIView.animate(withDuration: 0.25, animations: {
            //makes it go from smaller to bigger
            self.view.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
           self.view.alpha = 0.0
        }) { (success) in
            if success {
                //once finishes, it removes from view
                self.store.userIsOnBreak = true
                self.performSegue(withIdentifier: "showTabBar", sender: self)
            }
        }
    }

}
