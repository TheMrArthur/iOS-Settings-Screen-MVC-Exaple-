//
//  SwitchTableViewCell.swift
//  iOSSettingsScreen HW13
//
//  Created by Артур Горлов on 12.09.2022.
//

import UIKit
import SnapKit

class SwitchTableViewCell: DefaultTableViewCell {
    
    // MARK: - UI Elements
    
    private lazy var switchCell: UISwitch = {
        switchCell = UISwitch()
        switchCell.addTarget(self, action: #selector(switchPressed), for: .valueChanged)
        return switchCell
    }()
    
    // MARK: - Initialisers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Cell
    
    private func setupHierarchy() {
        contentView.addSubview(switchCell)
    }
    
    private func setupLayout() {
        switchCell.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }
    }
    
    // MARK: - Actions
    
    @objc private func switchPressed(_ sender: UISwitch) {
        if sender.isOn {
            print("\(cellSetups?.nameCell ?? "") is On")
        } else {
            print ("\(cellSetups?.nameCell ?? "") is Off")
        }
    }
}
