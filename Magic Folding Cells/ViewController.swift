//
//  ViewController.swift
//  Magic Folding Cells
//
//  Created by Rodrigo Alejandro Juarez on 4/11/16.
//  Copyright © 2016 Rodrigo Alejandro Juarez. All rights reserved.
//

let kCloseCellHeight: CGFloat = 100
let kOpenCellHeight: CGFloat = 200 // equal or greater containerView height

import UIKit
import FoldingCell

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var cellHeights = [CGFloat]()
    
    var items: [String] = ["Folding", "Cells", "Demo"]

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(items.count)
        
        for _ in 0...items.count {
            cellHeights.append(kCloseCellHeight)
        }

    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if cell is FoldingCell {
            let foldingCell = cell as! FoldingCell
            
            if cellHeights[indexPath.row] == kCloseCellHeight {
                foldingCell.selectedAnimation(false, animated: false, completion:nil)
            } else {
                foldingCell.selectedAnimation(true, animated: false, completion: nil)
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.items.count)
        return self.items.count;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! FoldingCell
        
        var duration = 0.0
        if cellHeights[indexPath.row] == kCloseCellHeight { // open cell
            cellHeights[indexPath.row] = kOpenCellHeight
            cell.selectedAnimation(true, animated: true, completion: nil)
            duration = 0.5
        } else {// close cell
            cellHeights[indexPath.row] = kCloseCellHeight
            cell.selectedAnimation(false, animated: true, completion: nil)
            duration = 1.1
        }
        
        UIView.animateWithDuration(duration, delay: 0, options: .CurveEaseOut, animations: { () -> Void in
            tableView.beginUpdates()
            tableView.endUpdates()
            }, completion: nil)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("cellForRowAtIndexPath")
        
        let cell:CustomFoldingTableCell = self.tableView.dequeueReusableCellWithIdentifier("foldingCell", forIndexPath: indexPath) as! CustomFoldingTableCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

