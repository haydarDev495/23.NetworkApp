//
//  CommentsTBC.swift
//  23.NetworkApp
//
//  Created by Haydar Bekmuradov on 13.09.22.
//

import UIKit

class CommentsTBC: UITableViewController {
    var postId: Int?
    var comments: [Comments] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchComments()
        title = "Post Comments"
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comments.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = comments[indexPath.row].name
        return cell
    }
    
    func fetchComments() {
        guard let postId = postId else { return }
        
        let pathUrl = "\(ApiConstant.commentPath)?postId=\(postId)"
        
        guard let url = URL(string: pathUrl) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                print(error)
            }
            
            guard let data = data else { return }
            
            do {
                self.comments = try JSONDecoder().decode([Comments].self, from: data)
                
            } catch {
                print(error)
            }
            
            DispatchQueue.main.async { [self] in
                tableView.reloadData()
            }
        }
        task.resume()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDetailComment", sender: indexPath)
    }
    
    //     MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailCommentVC {
            guard let indexPath = sender as? IndexPath else { return }
            
            vc.comments = comments[indexPath.row]
        }
    }
}
