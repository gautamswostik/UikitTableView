//
//  ViewController.swift
//  TableViewUIKit
//
//  Created by swostik gautam on 08/07/2023.
//

struct Contact {
    var name: String?
    var contact : String?
    var image : String?
    var country : String?
}

var contacts: [Contact] = [
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Nepal"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Nepal"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Nepal"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Nepal"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Nepal"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Nepal"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "USA"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "USA"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "USA"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "USA"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "USA"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Canada"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Canada"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Canada"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Canada"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Canada"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Japan"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Japan"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Japan"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Japan"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Japan"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Japan"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Korea"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Korea"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Korea"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Korea"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Korea"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Korea"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Germany"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Germany"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Germany"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Germany"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "Germany"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "France"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "France"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "France"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "France"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "France"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "France"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "France"),
    Contact(name: "Person", contact: "98xxxxxxxx", image: "person.circle" ,country: "France"),
]

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Table View"
        
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}


extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row].name! + " \(indexPath.row + 1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
        let nextScreen = CustomDesignTableViewController()
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
}
