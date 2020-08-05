//
//  DesafioView.swift
//  desafio-ios-marcelo-bianchi
//
//  Created by marcelo bianchi on 03/08/20.
//  Copyright © 2020 marcelo bianchi. All rights reserved.
//

import Foundation
import UIKit

class DesafioView: UIViewController, DesafioViewProtocol {
    
    var presenter: DesafioPresenterProtocol!
    private var heroList:[Hero] = []
    var tableViewHero: UITableView = {
        var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    var titleView: UILabel = {
        var title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Desafio iOS"
        title.font = UIFont(name: "Courier", size: 18)
        return title
    }()
    
//    override init(presenter: DesafioPresenterProtocol) {
//        self.presenter = presenter
//    }
    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
    
    override func viewDidLoad() {
        setupView()
        presenter.viewDidLoad()
    }
    
    
    func setupView() {
        
        let newView = UIView()
        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.backgroundColor = .green
        self.view = newView
        
        newView.addSubview(titleView)
        self.titleView.leftAnchor.constraint(equalTo: newView.leftAnchor, constant: 10).isActive = true
        self.titleView.topAnchor.constraint(equalTo: newView.topAnchor, constant: 5).isActive = true
        
        
        newView.addSubview(tableViewHero)
        self.tableViewHero.leftAnchor.constraint(equalTo: newView.leftAnchor, constant: 32.0).isActive = true
        self.tableViewHero.topAnchor.constraint(equalTo: newView.topAnchor, constant: 120.0).isActive = true
        self.tableViewHero.rightAnchor.constraint(equalTo: newView.rightAnchor, constant: -32.0).isActive = true
        self.tableViewHero.bottomAnchor.constraint(equalTo: newView.bottomAnchor, constant: -32.0).isActive = true

        // set delegate and datasource
        self.tableViewHero.delegate = self
        self.tableViewHero.dataSource = self

        // register a defalut cell
        self.tableViewHero.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    func updatedata(heroes: [Hero]) {
        DispatchQueue.main.async {
            self.tableViewHero.reloadData()
        }
    }

}


// MARK:- Table delegate
extension DesafioView: UITableViewDelegate {
    // details
}

// MARK:- Table datasource
extension DesafioView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        heroList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        return cell
    }
    
    
}
