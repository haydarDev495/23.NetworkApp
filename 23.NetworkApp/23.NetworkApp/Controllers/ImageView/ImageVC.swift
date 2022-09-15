//
//  ImageVC.swift
//  23.NetworkApp
//
//  Created by Haydar Bekmuradov on 11.09.22.
//

import UIKit

class ImageVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    private let imageUrl = "https://rjbailey.files.wordpress.com/2015/08/15-205.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImageData()
    }
    
    private func fetchImageData() {
        guard let url = URL(string: imageUrl) else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.activityIndicatorView.stopAnimating()
                if let error = error {
                    print(error)
                }
                if let response = response {
                    print(response)
                }
                if let data = data {
                    print(data)
                    self?.imageView.image = UIImage(data: data)
                }
            }
        }
        task.resume()
    }
}
