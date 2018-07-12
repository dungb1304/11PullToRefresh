//
//  TableViewController.swift
//  11PullToRefresh
//
//  Created by DungB96 on 2018/06/13.
//  Copyright © 2018 DungB96. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var numbers = Array(1...5)
    
    var updateData : UIRefreshControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateData = UIRefreshControl()
        let attributes = [NSAttributedStringKey.foregroundColor : UIColor.blue]
        updateData.attributedTitle = NSAttributedString(string: "Updating the data", attributes: attributes)
        updateData.addTarget(self, action: #selector(TableViewController.loadNewData), for: UIControlEvents.valueChanged)
        updateData.backgroundColor = UIColor.green
        updateData.tintColor = UIColor.brown
        tableView.addSubview(updateData)
        
        //remove the lastest cell border
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        
    }
    
    @objc func loadNewData(){
        let i = numbers.count
        let number = numbers[i - 1]
        numbers.append(number + 1)
        
        tableView.reloadData()
        updateData.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numbers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = String(numbers[indexPath.row])

        return cell
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

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
