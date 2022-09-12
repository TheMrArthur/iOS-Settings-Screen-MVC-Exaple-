//
//  LabelTableViewCell.swift
//  iOSSettingsScreen HW13
//
//  Created by Артур Горлов on 12.09.2022.
//

import UIKit
import SnapKit

class LabelTableViewCell: DefaultTableViewCell {
    
    override var cellSetups: CellSetups? {
        didSet {
            labelCell.text = cellSetups?.rightLabel
        }
    }
    
    // MARK: - UI Elements
    
    private lazy var labelCell: UILabel = {
        labelCell = UILabel()
        labelCell.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        labelCell.contentMode = .scaleAspectFit
        labelCell.textColor = .lightGray
        return labelCell
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
        addSubview(labelCell)
    }
    
    private func setupLayout() {
        labelCell.snp.makeConstraints {
            $0.centerY.equalTo(leftLabel)
            $0.trailing.equalToSuperview().inset(40)
        }
    }
}
