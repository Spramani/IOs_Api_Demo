//
//  ViewController.swift
//  api_Demo
//
//  Created by MAC on 29/10/20.
//

import UIKit

class ViewController: UIViewController{
   

    @IBOutlet weak var search: UISearchBar!
   
    @IBOutlet weak var tblview: UITableView!
      var listofholiday = [HolidayDetail](){
        didSet {
            DispatchQueue.main.async {
                self.tblview.reloadData()
                self.navigationController?.title = "\(self.listofholiday.count) holidayFiels"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }
    
    

}

extension ViewController:UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
      
        
        guard let Searchtext =  searchBar.text    else {
                return
        }
      let holidayrequest = HolidayRequest(countryCode: Searchtext)
        holidayrequest.getholidays { [weak self] result in
            
            switch result {
            case .failure(let error):
                print(error)
            case .success(let holiday):
                self?.listofholiday = holiday
            }
            
        }
        
        searchBar.returnKeyType = .search
        searchBar.text = ""
    }
    
}
extension ViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listofholiday.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cells = tblview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! tableviewTableViewCell
        let holiday = listofholiday[indexPath.row]
        cells.lbl.text = holiday.name
        cells.lbl1.text = holiday.date.iso
        return cells
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
