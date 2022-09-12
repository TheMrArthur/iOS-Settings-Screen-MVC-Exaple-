//
//  TableView.swift
//  iOS Settings Screen (MVC Exaple)
//
//  Created by Артур Горлов on 12.09.2022.
//

import UIKit
import SnapKit

final class TableView: UIView {

    // MARK: - UI Elements

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = .black
        tableView.separatorColor = .darkGray
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 55, bottom: 0, right: 0)
        tableView.register(DefaultTableViewCell.self, forCellReuseIdentifier: "DefaultTableViewCell")
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: "SwitchTableViewCell")
        tableView.register(LabelTableViewCell.self, forCellReuseIdentifier: "LabelTableViewCell")
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: "ImageTableViewCell")
        tableView.register(PersonalTableViewCell.self, forCellReuseIdentifier: "PersonalTableViewCell")
        tableView.register(FindingTableViewCell.self, forCellReuseIdentifier: "FindingTableViewCell")
        return tableView
    }()

    // MARK: - Initialisers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup View

    private func setupHierarchy() {
        addSubview(tableView)
    }

    private func setupLayout() {
        tableView.snp.makeConstraints {
            $0.top.trailing.bottom.leading.equalToSuperview()
        }
    }
}
