//
//  DetailUserVC.swift
//  23.NetworkApp
//
//  Created by Haydar Bekmuradov on 11.09.22.
//

import UIKit

class DetailUserVC: UIViewController {

    var user: User?
    
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var username: UILabel!
    @IBOutlet private weak var email: UILabel!
    @IBOutlet private weak var phone: UILabel!
    @IBOutlet private weak var website: UILabel!
//    @IBOutlet var address: Address?
//    @IBOutlet var company: Company?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
    @IBAction func postAction() {
        let vc = UIStoryboard(name: "PostsAndComments", bundle: nil).instantiateViewController(withIdentifier: "PostsTVC") as! PostsTVC
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func albomAction() {
        
    }
    @IBAction func toDoAction() {
        
    }
    
    private func setupUI() {
        name.text = user?.name
        username.text = user?.username
        email.text = user?.email
        phone.text = user?.phone
        website.text = user?.website
    }
}
