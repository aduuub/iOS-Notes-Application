//
//  AddNoteTableViewController.swift
//  Notes
//
//  Created by PJ Vea on 2/7/15.
//  Copyright (c) 2015 Vea Software. All rights reserved.
//

import UIKit

class AddNoteTableViewController: UITableViewController {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    var object: PFObject!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if (self.object != nil) {
            
            self.titleField?.text = self.object["title"] as? String
            self.textView?.text = self.object["text"] as? String
            
        }else {
            
            self.object = PFObject(className: "Note")
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveAction(sender: UIBarButtonItem) {
        
        self.object["username"] = PFUser.currentUser().username
        self.object["title"] = self.titleField?.text
        self.object["text"] = self.textView?.text
        
        self.object.saveEventually { (success, error) -> Void in
            
            if (error == nil) {
                
                
                
            }else {
                
                println(error.userInfo)
                
            }
            
        }
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
