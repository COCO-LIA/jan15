//
//  ViewController.swift
//  jan15
//
//  Created by 황현지 on 2021/01/15.
//

import UIKit

class ViewController: UIViewController {

    //
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //
    //
    
    //
    //


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 10
        }
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)

            cell1.textLabel?.text = "test"
            cell1.detailTextLabel?.text = "detail"

            return cell1
            
        } else {
            
            
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)

            cell2.textLabel?.text = "test"

            return cell2
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "UpcomingMovie"
        }
        return "PopularMovie"
    }
    
    
}

