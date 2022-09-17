//
//  DetailPostVC.swift
//  23.NetworkApp
//
//  Created by Haydar Bekmuradov on 13.09.22.
//

import UIKit

class DetailPostVC: UIViewController {
    
    var post: Post?

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        titleLabel.text = post?.title
        bodyLabel.text = post?.body
        title = "Detail Post"
    }
    
    @IBAction func commentsButtonACtion() {
        performSegue(withIdentifier: "goToComments", sender: nil)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CommentsTBC {
            vc.postId = post?.id
        }
    
    }
}
