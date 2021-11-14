//
//  ViewController.swift
//  Challenge Accepted
//
//  Created by Nayeem Nazmul on 2021/11/5.
//  Copyright © 2021 Nayeem. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var countries = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All the flags"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items {
            if item.hasSuffix(".png") {
                countries.append(item)
            }
        }
//        print(countries)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flag", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController  {
            vc.selectedImage = countries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    
    
}

