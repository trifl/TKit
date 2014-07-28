//
//  ViewController.swift
//  TKitExamples
//
//  Created by JP McGlone on 6/30/14.
//  Copyright (c) 2014 trifl. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView()
    
    let tests = [["name":"TKTimer", "class":"TKTimerViewController"]] as NSArray
    let classes : Dictionary<String, ()->UIViewController> = [
        "TKTimerViewController" : { return TKTimerViewController() }
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TKit"
        
        setupTableView()
        
        tableView.reloadData()
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        tableView.frame = self.view.bounds
        view.addSubview(tableView)
    }
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return tests.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var reuseIdentifier = "test"
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as? UITableViewCell
        if (!cell) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: reuseIdentifier)
        }
        
        cell!.textLabel.text = tests[indexPath.row]!["name"] as String
        cell!.detailTextLabel.text = tests[indexPath.row]!["class"] as String
        
        return cell
    }
    
    func controllerFromName(className: String) -> UIViewController {
        if (className == "TKTimerViewController") { return TKTimerViewController() }
        return UIViewController()
    }
    
    // MARK: UITableViewDelegate
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        var className = tests[indexPath.row]!["class"] as String
        // TODO: why isn't this working?
        // var viewController: UIViewController = classes[className] as UIViewController
        var viewController = controllerFromName(className)
        self.navigationController.pushViewController(viewController, animated: true)
    }
}

