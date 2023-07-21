//
//  ViewController.swift
//  tableView-tutorial
//
//  Created by dhui on 2023/07/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    var dummyDataList: [String] = [
        "Stephen Curry",
        "Lebron James",
        "Marcus Rashford",
        "Bruno Fernandes",
        "Andre Onana",
        "Lisandro Martinez",
        "Casemiro",
        "Rafael Varane",
        "Mason Mount",
        "Ten Hag"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    
    // UITableViewDataSource protocol을 준수하기 위해서 만들어야 하는 functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dummyDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "My cell")
        cell.textLabel?.text = dummyDataList[indexPath.row]
        cell.detailTextLabel?.text = "This is what I like"
        
        return cell
    }
    
    // UITableViewDelegate protocol의 function (optional임)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#fileID, #function, #line, "- indexPath: \(indexPath.row)")
    }

}

