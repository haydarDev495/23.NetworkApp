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
        title = "Posts"
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDetailPost", sender: indexPath)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailPostVC,
           let indexPath = sender as? IndexPath {
            vc.post = posts[indexPath.row]
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = post.title
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
