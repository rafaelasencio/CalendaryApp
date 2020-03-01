//
//  ViewController.swift
//  Calendary
//
//  Created by Rafael on 01/03/2020.
//  Copyright © 2020 RafaelAB. All rights reserved.
//

import UIKit

class CalendaryController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var listHolidays = [HolidayDetail]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "\(self.listHolidays.count) Holidays found"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listHolidays.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        let holiday = listHolidays[indexPath.row]
        cell.textLabel?.text = holiday.name
        cell.detailTextLabel?.text = holiday.date.iso
        return cell
    }
}

extension CalendaryController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("clicked")
        guard let searchBarText = searchBar.text else {return}
        let holidayRequest = HolidayRequest.init(countryCode: searchBarText)
        holidayRequest.getHolidays { [weak self] result in
            switch result {
            case .failure(let error): print(error)
            case .success(let holidays): self?.listHolidays = holidays
            }
        }
    }
    
}

