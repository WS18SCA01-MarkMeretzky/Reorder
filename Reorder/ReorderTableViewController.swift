//
//  ReorderTableViewController.swift
//  Reorder
//
//  Created by Mark Meretzky on 2/12/19.
//  Copyright © 2019 New York University School of Professional Studies. All rights reserved.
//

import UIKit;

class ReorderTableViewController: UITableViewController {
    
    var lines: [String] = [
        "M is for the million things she gave me,",
        "O means only that she’s growing old,",
        "T is for the tears she shed to save me",
        "H is for her heart of purest gold;",
        "E is for her eyes, with love-light shining,",
        "R means right, and right she’ll always be,",
        "Put them all together, they spell ______,", //6 underscores
        "A word that means the world to me.",
        "—Howard Johnson"                            //one em dash
    ];
    
    override func viewDidLoad() {
        super.viewDidLoad();
        lines.shuffle();
        
        // Uncomment the following line to preserve selection between presentations
        // clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        navigationItem.rightBarButtonItem = editButtonItem;
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lines.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "reorderCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = lines[indexPath.row];
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none;
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    
    // Override to support rearranging the table view.
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let line: String = lines[fromIndexPath.row];
        lines.remove(at: fromIndexPath.row);
        lines.insert(line, at: to.row);
        
        if String(lines.map {$0.first!}) == "MOTHERPA—" {   //first character on each line
            //The poem has been unscrambled.   Change the ______ to MOTHER.
            guard let i: Int = lines.firstIndex(where: {$0.contains("______")}) else {
                fatalError("could not find \"______\"");
            }
            lines[i] = lines[i].replacingOccurrences(of: "______", with: "MOTHER");
            navigationItem.title = "Mother ❤️";
        }
        
        tableView.reloadData();
    }
    
    /*
     // Override to support conditional rearranging of the table view.
     
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true;
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
