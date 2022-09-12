//
//  DefaultTableViewCell.swift
//  iOSSettingsScreen HW13
//
//  Created by Артур Горлов on 12.09.2022.
//

import UIKit
import SnapKit

class DefaultTableViewCell: UITableViewCell {
    
    var cellSetups: CellSetups? {
        didSet {
            iconImage.image = cellSetups?.icon
            iconView.backgroundColor = cellSetups?.iconBackgroundColor
            leftLabel.text = cellSetups?.nameCell
        }
    }
    
    // MARK: - UI Elements
    
    lazy var iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.layer.cornerRadius = 5
        return iconView
    }()
    
    lazy var iconImage: UIImageView = {
        let iconImage = UIImageView()
        iconImage.tintColor = .white
        iconImage.contentMode = .scaleAspectFit
        iconImage.clipsToBounds = true
        return iconImage
    }()
    
    lazy var leftLabel: UILabel = {
        let leftLabel = UILabel()
        leftLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        leftLabel.textColor = .white
        return leftLabel
    }()
    
    private lazy var selectedColorView: UIView = {
        let selectedColorView = UIView()
        selectedColorView.backgroundColor = .quaternarySystemFill
        return selectedColorView
    }()
    
    // MARK: - Initialisers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .tertiarySystemFill
        self.selectedBackgroundView = selectedColorView
        self.tintColor = .white
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Cell
    
    private func setupHierarchy() {
        addSubview(iconView)
        iconView.addSubview(iconImage)
        addSubview(leftLabel)
    }
    
    private func setupLayout() {
        iconView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(17)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(30)
        }
        
        iconImage.snp.makeConstraints {
            $0.centerY.centerX.equalTo(iconView)
            $0.size.equalTo(iconView).inset(3)
        }
        
        leftLabel.snp.makeConstraints {
            $0.centerY.equalTo(iconView)
            $0.leading.equalTo(iconView.snp.trailing).offset(10)
        }
    }
}
