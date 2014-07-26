//
//  ViewController.swift
//  TKitExamples
//
//  Created by JP McGlone on 6/30/14.
//  Copyright (c) 2014 trifl. All rights reserved.
//

import UIKit

private let _tktimer = "TKTimer"
private let _tktest = "TKTest"

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView()
    
    let tests = [["name":"TKTimer", "class":"TKTimerViewController", "type":_tktimer]] as NSArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TKit"
        
        setupTableView()
        
        tableView.reloadData()
    }
    
    func go(type: String) {
        if (type == _tktimer) { goTKTimer() }
        else if (type == _tktest) { goTKTimer() }
    }
    
    func goTKTimer() {
        var tkTimerViewController = TKTimerViewController()
        self.navigationController.pushViewController(tkTimerViewController, animated: true)
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
    
    // MARK: UITableViewDelegate
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        var type = tests[indexPath.row]!["type"] as String
        go(type)
    }
}

