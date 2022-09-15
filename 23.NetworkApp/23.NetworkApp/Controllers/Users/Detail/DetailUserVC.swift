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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func addressButtonAction() {
        performSegue(withIdentifier: "goToAddress", sender: nil)
    }
    
    @IBAction func postAction() {
        let vc = UIStoryboard(name: "PostsAndComments", bundle: nil).instantiateViewController(withIdentifier: "PostsTVC") as! PostsTVC
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupUI() {
        title = "Detail"
        name.text = "Name: \(user?.name ?? "")"
        username.text = "Username: \(user?.username ?? "")"
        email.text = "Email: \(user?.email ?? "")"
        phone.text = "Phone: \(user?.phone ?? "")"
        website.text = "Website: \(user?.website ?? "")"
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let vc = segue.destination as? AddressVC {
            vc.address = user?.address
        }
    }

}
