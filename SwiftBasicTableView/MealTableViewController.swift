//
//  MealTableViewController.swift
//  SwiftBasicTableView
//
//  Created by guo on 16/4/18.
//  Copyright © 2016年 guo. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var arr_meal = [Meal]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem()
        loadMealData()
    }
    
    // MARK: Actions
    
    func loadMealData() {
        
        let photo1 = UIImage(named: "meal1")!
        let photo2 = UIImage(named: "meal2")!
        let photo3 = UIImage(named: "meal3")!
        // 加入的数组的对象不能为空，所有，meal 对象后都需要加上！
        let meal1  = Meal(name: "Food one", photo: photo1, rating: 4)!
        let meal2  = Meal(name: "Food two", photo: photo2, rating: 5)!
        let meal3  = Meal(name: "Food Four", photo: photo3, rating: 3)!
        
        arr_meal += [meal1,meal2,meal3]
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arr_meal.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MEAL_CELL", forIndexPath: indexPath) as!MealCell
        let meal = arr_meal[indexPath.row]
        
        cell.lb_name.text    = meal.name
        cell.img_meal.image  = meal.photo
        cell.v_rating.rating = meal.rating

        return cell
    }
    
    // Exit
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        
        if let sourceVC = sender.sourceViewController as? ViewController, meal = sourceVC.meal {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                arr_meal[selectedIndexPath.row] = meal
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            }
            else {
                let newIndexPath = NSIndexPath(forRow: arr_meal.count, inSection: 0)
                arr_meal.append(meal)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
        }
    }

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            arr_meal.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowDetail" {
            
            let detailVC = segue.destinationViewController as! ViewController
            if let selectedCell = sender as? MealCell {
                let indexPath    = tableView.indexPathForCell(selectedCell)!
                let selectedMeal = arr_meal[indexPath.row]
                
                detailVC.meal    = selectedMeal
            }
        }
        else if segue.identifier == "AddItem" {
            
            print("Add new meal")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
