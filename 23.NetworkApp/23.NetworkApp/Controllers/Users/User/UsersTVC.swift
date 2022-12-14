//
//  UsersTVC.swift
//  23.NetworkApp
//
//  Created by Haydar Bekmuradov on 11.09.22.
//

import UIKit

class UsersTVC: UITableViewController {
    
    var users: [User] = []

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        cell.detailTextLabel?.text = users[indexPath.row].username
        return cell
    }

    // MARK: - Table view delegates
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailUserVC") as! DetailUserVC
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Func's
    func fetchUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                print(error)
            }
            
            guard let data = data else { return }
            
            do {
                self.users = try JSONDecoder().decode([User].self, from: data)
            } catch {
                print(error)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
}
