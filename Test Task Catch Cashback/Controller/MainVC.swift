//
//  ViewController.swift
//  Test Task Catch Cashback
//
//  Created by Dmitry Sachkov on 03.03.2021.
//

import UIKit
import Alamofire
import RealmSwift


class MainVC: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    let realm = try! Realm()
    var dataArray: [DataModel] = []
    let urlString = "https://jsonplaceholder.typicode.com/photos"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.getModelData()
        self.loadData()
        
    }

    func loadData() {
        var array: [DataModel] = []
        print(Realm.Configuration.defaultConfiguration.fileURL)
        let items = realm.objects(DataModel.self)
        for i in items {
            array.append(i)
        }
        dataArray = array
    }
    
    func getModelData() {
        
        guard let url = URL(string: urlString) else { return }
        
        AF.request(url, method: .get).responseDecodable(of: [DataModel].self) { [weak self] response in
            self?.dataArray = response.value ?? []
            self?.tableView.reloadData()
            do {
                try self?.realm.write() {
                    self?.realm.add(self?.dataArray ?? [])
                }
            }
            catch {
                let error = Error.self
                print("We got some Error \(error)")
            }
        }
    }

}

extension MainVC: UITabBarDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = (tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomCell) {
        let item = dataArray[indexPath.row]
        cell.refresh(item)
        return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(identifier: "DetailVC") as! DetailVC
        let data = dataArray[indexPath.row]
        let titleStr = data.title
        let urlStr = data.url
        vc.titleString = titleStr
        vc.urlString = urlStr
        navigationController?.pushViewController(vc, animated: true)
    }
}
