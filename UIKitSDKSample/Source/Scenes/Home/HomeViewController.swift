//
//  HomeViewController.swift
//  UIKitSDKSample
//
//  Created by Tiago Linhares on 10/07/23.
//

import SDKCore
import SnapKit
import UIKit

final class HomeViewController: UIMVVMBaseViewController<HomeViewModelProtocol> {
    
    // MARK: - UI Elements
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    // MARK: - View Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension HomeViewController: UIViewCode {
    
    // MARK: - View Setup
    
    func setupView() {
        title = "UIKit Samples"
        view.backgroundColor = .white
    }
    
    func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.samples.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: HomeTableViewCell.identifier,
            for: indexPath
        ) as? HomeTableViewCell else { fatalError() }
        
        cell.configure(text: viewModel.samples[indexPath.row].name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectSample(at: indexPath.row)
    }
}
