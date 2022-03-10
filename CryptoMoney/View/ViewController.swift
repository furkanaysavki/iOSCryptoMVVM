//
//  ViewController.swift
//  CryptoMoney
//
//  Created by Furkan Ayşavkı on 10.03.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
   
    
    @IBOutlet weak var tableView: UITableView!
    
    private var cryptoListViewModel : CryptoListViewModel!
    var colorArray = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        self.colorArray = [
        UIColor(red: 80/255, green: 73/255, blue: 165/255, alpha: 1.0),
        UIColor(red: 120/255, green: 85/255, blue: 72/255, alpha: 1.0),
        UIColor(red: 140/255, green: 124/255, blue: 92/255, alpha: 1.0),
        UIColor(red: 45/255, green: 140/255, blue: 65/255, alpha: 1.0),
        UIColor(red: 38/255, green: 165/255, blue: 122/255, alpha: 1.0),
        UIColor(red: 123/255, green: 154/255, blue: 12/255, alpha: 1.0),
        ]
        
      getData()
    }
    
    func getData(){
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        Webservice().downloadCurrencies(url : url) {(cryptos) in
            if let cryptos = cryptos {
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(index: indexPath.row)
        cell.priceLabel.text = cryptoViewModel.price
        cell.currencyLabel.text = cryptoViewModel.name
        cell.backgroundColor = self.colorArray[indexPath.row % 6]
        return cell
    }


}

