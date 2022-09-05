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
    
    private let viewModel = TableViewModel()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        tableView.backgroundColor = #colorLiteral(red: 0.662745098, green: 0.8705882353, blue: 0.9764705882, alpha: 1)
        
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "catCellIdentifier")
        
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.barTintColor =  #colorLiteral(red: 0.662745098, green: 0.8705882353, blue: 0.9764705882, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        
        tableView.delegate = self

        viewModel.fetchBreeds()
        setupViewModel()
        
    }
    
    private func setupViewModel() {
        viewModel.reloadHandler = {
            self.tableView.reloadData()
        }
    }
}

extension TableViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.viewModel.itemCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "catCellIdentifier", for: indexPath)
        cell.textLabel?.text = self.viewModel.itemForTableView(indexPath)
        cell.backgroundColor = #colorLiteral(red: 0.662745098, green: 0.8705882353, blue: 0.9764705882, alpha: 1)
        return cell
    }
}

extension TableViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let index = (tableView.indexPathForSelectedRow?.row) else{
            return
        }

        let selectedCat = viewModel.itemSelected(index)
        
        let vc = MoreCatInfoViewController()
        vc.breed = selectedCat
        navigationController?.pushViewController(vc, animated: true)
    }
}
