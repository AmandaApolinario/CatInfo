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
    var catsInfo:[BreedInfo] = []
    let url = "https://api.thecatapi.com/v1/breeds"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        
        tableView.delegate = self
        tableView.register(UINib(nibName: "CatCell", bundle: nil), forCellReuseIdentifier: "reusableCell")
        tableView.dataSource = self
        
        fetchBreeds()
    }
  
    func fetchBreeds() {
        let decoder = JSONDecoder()
        
        let request = Alamofire.request(url)
        
        request.responseJSON { data in
            
            guard let dataObj = data.data else {
                return
            }
            do{
                let breedInfo = try decoder.decode([BreedInfo].self, from: dataObj)
                self.catsInfo = breedInfo
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch let ex {
                print(ex.localizedDescription)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MoreCatInfoViewController {
            
            guard let index = (tableView.indexPathForSelectedRow?.row) else{
                return
            }
            destination.breed = catsInfo[index]
        }
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.catsInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath) as! CatCell
        cell.breedLabel.text = self.catsInfo[indexPath.row].name
        return cell
    }
}

extension TableViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showCatInfo", sender: self) 
    }
}
