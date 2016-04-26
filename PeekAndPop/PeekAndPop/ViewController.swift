//
//  ViewController.swift
//  PeekAndPop
//
//  Created by Pradeep Kumar Yadav on 09/04/16.
//  Copyright © 2016 iosbucket. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIViewControllerPreviewingDelegate {
    
    @IBOutlet weak var tblPeekPop: UITableView!
    let arrContents = ["First","Second","Third","Fourth","Five","Six"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 9.0, *) {
            if traitCollection.forceTouchCapability == UIForceTouchCapability.Available {
                registerForPreviewingWithDelegate(self, sourceView: self.tblPeekPop)
            }
        } else {
            // Fallback on earlier versions
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- TableView Datasource Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrContents.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("peekCell")!
        
        let lblTitle = cell.viewWithTag(500) as! UILabel
        lblTitle.text = arrContents[indexPath.row]
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    
    
    //MARK:- peek and pop functions
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let objPreviewView = storyboard.instantiateViewControllerWithIdentifier("PreviewViewController") as? PreviewViewController
        
        objPreviewView!.preferredContentSize = CGSize(width: 0.0, height:280.0)
        return objPreviewView
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit :UIViewController) {
        
        showViewController(viewControllerToCommit, sender: self)
    }
    
    
}

