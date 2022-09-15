//
//  DetailCommentVC.swift
//  23.NetworkApp
//
//  Created by Haydar Bekmuradov on 13.09.22.
//

import UIKit

class DetailCommentVC: UIViewController {
    @IBOutlet var name: UILabel!
    @IBOutlet var email: UILabel!
    @IBOutlet var body: UILabel!

    var comments: Comments?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let commentName = comments?.name,
              let commentEmail = comments?.email,
              let commentBody = comments?.body else { return }

        name.text = "Name: \(commentName)"
        email.text = "Email: \(commentEmail)"
        body.text = "Body: \(commentBody)"

        title = "Detail Comment"
    }
}
