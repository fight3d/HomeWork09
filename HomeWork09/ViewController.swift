//
//  ViewController.swift
//  HomeWork09
//
//  Created by 3droot on 09.11.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrayOfUsers = [
                        ["Fight3d", "Александр"],
                        ["Artem Mel'kevich", "Артем"],
                        [ "evgen patlay", "Евгений"],
                        ["syvashenkoBohdan","Богдан" ],
                        ["Yevhenii", "Евгений"],
                        ["Евгений Худолий", "Евгений"]
                        ]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
    @IBAction func editAction(_ sender: Any) {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
}

extension ViewController: UITableViewDelegate{
    
}
extension ViewController :UITableViewDataSource{
    

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath)
        cell.textLabel?.text = arrayOfUsers[indexPath.row][1]
        cell.detailTextLabel?.text = arrayOfUsers[indexPath.row][0]

        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            arrayOfUsers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        case .insert:
            print("insert")
        case .none:
            print("none")
        @unknown default:
            fatalError()
        }
    }
    
}
