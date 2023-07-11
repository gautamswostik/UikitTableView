//
//  MultiTableViewController.swift
//  TableViewUIKit
//
//  Created by swostik gautam on 11/07/2023.
//

import UIKit

struct ListToRender {
    var type: String?
    var item: String?
}

var items : [ListToRender] = [
    ListToRender(type: "DATE" ,item: "22/02/2022"),
    ListToRender(type: "LABEL" ,item: "22/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/2022"),
    ListToRender(type: "LABEL" ,item: "22/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/2022"),
    ListToRender(type: "DATE" ,item: "22/02/2022"),
    ListToRender(type: "LABEL" ,item: "22/02/2022"),
    ListToRender(type: "LABEL" ,item: "22/02/2022"),
    ListToRender(type: "LABEL" ,item: "22/022/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/202222/02/20222/2022"),
    ListToRender(type: "LABEL" ,item: "22/02/2022"),
    ListToRender(type: "LABEL" ,item: "22/02/2022"),
    ListToRender(type: "DATE" ,item: "22/02/2022"),
    ListToRender(type: "LABEL" ,item: "22/02/2022"),
    ListToRender(type: "LABEL" ,item: "22/02/2022"),
    ListToRender(type: "LABEL" ,item: "22/02/2022"),
    ListToRender(type: "LABEL" ,item: "22/02/2022"),
    ListToRender(type: "LABEL" ,item: "22/02/2022"),
]



import UIKit

class MultiTableViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(LabelTableViewCell.self, forCellReuseIdentifier: LabelTableViewCell.identifier)
        tableView.register(DateTableViewCell.self, forCellReuseIdentifier: DateTableViewCell.dateIdentifier)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

extension MultiTableViewController: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch items[indexPath.row].type {
        case "DATE":
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DateTableViewCell.dateIdentifier, for: indexPath) as? DateTableViewCell else {return UITableViewCell()}
            cell.date = items[indexPath.row].item  ?? ""
            return cell
        case "LABEL":
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier, for: indexPath) as? LabelTableViewCell else {return UITableViewCell()}
            cell.item = items[indexPath.row].item  ?? ""
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(items[indexPath.row])
    }
    
}
