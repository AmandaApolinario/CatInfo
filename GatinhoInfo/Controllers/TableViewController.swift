//
//  TableViewController.swift
//  GatinhoInfo
//
//  Created by Inpeaceapp on 22/08/2022.
//  Copyright © 2022 Amanda. All rights reserved.
//

import UIKit
import Alamofire

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = TableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        
        tableView.delegate = self
        tableView.register(UINib(nibName: "CatCell", bundle: nil), forCellReuseIdentifier: "reusableCell")
        tableView.dataSource = self
        
        self.viewModel.fetchBreeds()
        self.setupViewModel()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MoreCatInfoViewController {
            guard let index = (tableView.indexPathForSelectedRow?.row) else{
                return
            }
            destination.breed = self.viewModel.itemSelected(index)
        }
    }
    
    private func setupViewModel() {
        self.viewModel.reloadHandler = {
            self.tableView.reloadData()
        }
    }
}

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.viewModel.itemCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath) as! CatCell
        
        cell.breedLabel.text = self.viewModel.item(indexPath)
        return cell
    }
}

extension TableViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showCatInfo", sender: self)
    }
}
