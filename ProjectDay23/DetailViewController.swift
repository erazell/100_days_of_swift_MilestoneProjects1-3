//
//  DetailViewController.swift
//  ProjectDay23
//
//  Created by Janusz  on 07/05/2020.
//  Copyright © 2020 Janusz . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let selectedImage = selectedImage else {
            print("no selected image")
            return
        }
        imageView.image = UIImage(named: selectedImage)
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.cgColor
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

}
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           navigationController?.hidesBarsOnTap = true
       }
       override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
           navigationController?.hidesBarsOnTap = false
       }

    
    @objc func shareTapped(){
        guard let item = imageView.image?.jpegData(compressionQuality: 0.8)else {
            print("no imgae found")
            return
        }
        let vc = UIActivityViewController(activityItems: [item], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}
