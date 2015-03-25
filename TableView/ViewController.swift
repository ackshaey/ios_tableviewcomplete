//
//  ViewController.swift
//  TableView
//
//  Created by Ackshaey Singh on 3/24/15.
//  Copyright (c) 2015 Ackshaey Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var navTableItem: UINavigationItem!
    @IBOutlet weak var tableView: UITableView!
    var tableData = ["One","Two","Three","Four","Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen", "Twenty"]
    
    @IBAction func btnCancel(sender: UIBarButtonItem) {
        self.tableView.setEditing(false, animated: true)
            self.navTableItem.leftBarButtonItem?.enabled = false
            self.navTableItem.rightBarButtonItem?.enabled = true
    }
    @IBAction func btnEdit(sender: UIBarButtonItem) {
        self.tableView.setEditing(true, animated: true)
        self.navTableItem.leftBarButtonItem?.enabled = true
        self.navTableItem.rightBarButtonItem?.enabled = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        self.navTableItem.leftBarButtonItem?.enabled = false
        let nibForCustomCell = UINib(nibName: "CustomTableViewCell", bundle: nil)
        self.tableView.registerNib(nibForCustomCell, forCellReuseIdentifier: "myCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            tableData.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as UITableViewCell
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as CustomTableViewCell
        //cell.textLabel?.text = "\(indexPath.row)"
        
        let imagesArr = ["southpark_1.jpg", "southpark_2.jpg"]
        var index = Int(arc4random_uniform(2))
        let imageChosen = imagesArr[index]
        
        if let image = UIImage(named: imageChosen){
            cell.landscapeImageView.image = image
        }
        
        cell.landscapeLabel.text = "\(tableData[indexPath.row])"
        cell.landscapeSubLabel.text = "Description will be contained here"
        
        return cell
    }
    
    

}

