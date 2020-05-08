//
//  ViewController.swift
//  ProjectDay23
//
//  Created by Janusz  on 06/05/2020.
//  Copyright © 2020 Janusz . All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()
    var names = ["estonia", "france", "germany",
               "ireland", "italy", "monaco",
                "nigeria", "poland", "russia",
              "spain", "us", "uk"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Flags"
        navigationController?.navigationBar.prefersLargeTitles = true


        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let item = try! fm.contentsOfDirectory(atPath: path)

        for items in item{
            if items.hasSuffix("png"){
            pictures.append(items)
            }
            pictures.sort()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = names[indexPath.row].uppercased()
        cell.imageView?.image = UIImage(named: pictures[indexPath.row])
        cell.imageView?.layer.borderWidth = 1
        cell.imageView?.layer.borderColor = UIColor.black.cgColor

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController{
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

