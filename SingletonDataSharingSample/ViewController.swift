//
//  ViewController.swift
//  SingletonDataSharingSample
//
//  Created by 長内幸太郎 on 2018/11/17.
//  Copyright © 2018年 長内幸太郎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let data:[[String:Any]] = [["id":100,"title":"たいとる100","like":false],
                               ["id":101,"title":"たいとる101","like":false],
                               ["id":102,"title":"たいとる102","like":false],
                               ["id":103,"title":"たいとる103","like":false],
                               ["id":104,"title":"たいとる104","like":false],
                               ["id":105,"title":"たいとる105","like":false],
                               ["id":106,"title":"たいとる106","like":false],
                               ["id":107,"title":"たいとる107","like":false],
                               ["id":108,"title":"たいとる108","like":false],
                               ["id":109,"title":"たいとる109","like":false]]
    var dataModels:[MyModel] = []
    
    override func viewDidLoad() {
        dataModels = data.map { return MyModel(with: $0)}
        
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "MyTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dataModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        cell.setup(myModel: model)
        cell.didChangeLike = { (like:Bool) in
            model.like = like
            //TODO:API
        }
        
        return cell
    }
}

