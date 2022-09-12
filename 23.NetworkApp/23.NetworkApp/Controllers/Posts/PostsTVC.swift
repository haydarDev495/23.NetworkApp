//
//  PostsTVC.swift
//  23.NetworkApp
//
//  Created by Haydar Bekmuradov on 12.09.22.
//

import UIKit

class PostsTVC: UITableViewController {
    var user: User?
    
    var posts: [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPost()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        posts.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.body
        return cell
    }
    
    func fetchPost() {
        guard let userId = user?.id else { return }
        let pathUrl = "\(ApiConstant.postPath)?userId=\(userId)"
        guard let url = URL(string: pathUrl) else { return }
        
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                
                if let error = error {
                    print(error)
                }
                
                guard let data = data else { return }
                
                do {
                    self.posts = try JSONDecoder().decode([Post].self, from: data)
                    print(self.posts)
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
