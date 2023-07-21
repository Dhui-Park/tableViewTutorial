//
//  ViewController.swift
//  tableView-tutorial
//
//  Created by dhui on 2023/07/21.
//

import UIKit

class DefaultListVC: UIViewController {
    
    
    @IBOutlet weak var myTableView: UITableView!
    
//    var dummyDataList:[DummyData] = DummyData.getDummies()
    var dummyDataList:[DummySection] = DummySection.getDummies()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    
}

//MARK: - Data Source 관련
extension DefaultListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "헤더: " + dummyDataList[section].title
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "푸터: " + dummyDataList[section].title
    }
    
    // 섹션이 몇개인가
    func numberOfSections(in tableView: UITableView) -> Int {
        return dummyDataList.count
    }
    
    
    // UITableViewDataSource protocol을 준수하기 위해서 만들어야 하는 functions
    // 하나의 섹션안에 몇개의 rows가 있는가
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dummyDataList[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "My cell")
        
        let sectionData: DummySection = dummyDataList[indexPath.section]
        
        let cellData: DummyData = sectionData.rows[indexPath.row]
        
        cell.textLabel?.text = cellData.title
        cell.detailTextLabel?.text = cellData.body
        cell.detailTextLabel?.numberOfLines = 0
        
        return cell
    }
}

//MARK: - Delegate 관련
extension DefaultListVC: UITableViewDelegate {
    // UITableViewDelegate protocol의 function (optional임)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#fileID, #function, #line, "- indexPath: \(indexPath.row)")
    }
}
