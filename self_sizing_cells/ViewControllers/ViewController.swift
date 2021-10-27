//
//  ViewController.swift
//  self_sizing_cells
//
//  Created by Kunjeti Jassvanthh on 08/09/21.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
    private var results = [Bio]()
    private var nolines = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.results = People.function_to_get_data()
        self.nolines = Array(repeating: 3, count: self.results.count)
        
        tableView.reloadData()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 800
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomCell else{
            let cell = UITableViewCell(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            return cell
        }
        cell.person_description.numberOfLines = nolines[indexPath.row]
        cell.person_name.text = results[indexPath.row].name
        cell.person_description.text = results[indexPath.row].description
        //cell.person_image.image = UIImage(named: results[indexPath.row].image)
        let img = UIImage(named: results[indexPath.row].image)
        cell.person_image.layer.cornerRadius = cell.person_image.frame.size.height/2
        cell.person_image.layer.borderWidth = 5.0
        cell.person_image.layer.borderColor = CGColor(red: 117, green: 92, blue: 148, alpha: 0.7)
        cell.person_image.image = img
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell: CustomCell = tableView.cellForRow(at: indexPath) as? CustomCell else{
            print("Cell is not obtained")
            return
        }
        //cell.isOpened = !cell.isOpened
        tableView.beginUpdates()
        

        var numberOfLines = nolines[indexPath.row]
        numberOfLines = numberOfLines == 3 ? 0 : 3
        cell.person_description.numberOfLines = numberOfLines
        nolines[indexPath.row] = numberOfLines
        
        tableView.endUpdates()
    }
    
}
