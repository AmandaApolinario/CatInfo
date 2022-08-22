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

    let url = "https://api.thecatapi.com/v1/breeds"
    
    @IBOutlet weak var tableView: UITableView!
    
    let catsInfo:[BreedInfo] = [
        BreedInfo(name:"cat 1", description:"docile", temperament:"lala", image: Image(url:"https://cdn2.thecatapi.com/images/7CGV6WVXq.jpg")),
        BreedInfo(name:"cat 2", description:"angry", temperament:"aaa", image: Image(url:"https://cdn2.thecatapi.com/images/7CGV6WVXq.jpg")),
        BreedInfo(name:"cat 3", description:"cute", temperament:"teste", image:Image(url:"https://cdn2.thecatapi.com/images/7CGV6WVXq.jpg"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CatCell", bundle: nil), forCellReuseIdentifier: "reusableCell")
        
        
        fetchBreeds()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchBreeds() {
        //        let decoder: JSONDecoder = {
        //            let decoder = JSONDecoder()
        //            return decoder
        //        }()
        
        let request = Alamofire.request(url)
        
        request.responseJSON { (data) in
            print(data)
            
        }
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return catsInfo.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath) as! CatCell
        
        cell.breedLabel.text = catsInfo[indexPath.row].name
        return cell
        
    }
}

extension TableViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}


