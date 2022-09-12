//
//  ImageTableViewCell.swift
//  iOSSettingsScreen HW13
//
//  Created by Артур Горлов on 12.09.2022.
//

import UIKit
import SnapKit

class ImageTableViewCell: DefaultTableViewCell {

    // MARK: - UI Elements
    
    private lazy var imageCell: UIImageView = {
        imageCell = UIImageView()
        imageCell.tintColor = .systemRed
        imageCell.alpha = 0.9
        return imageCell
    } ()
    
    private lazy var rightLabelCell: UILabel = {
        rightLabelCell = UILabel()
        rightLabelCell.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        rightLabelCell.contentMode = .scaleAspectFill
        rightLabelCell.textColor = .white
        rightLabelCell.text = "1"
        return rightLabelCell
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
        addSubview(imageCell)
        imageCell.addSubview(rightLabelCell)
    }
    
    private func setupLayout() {
        imageCell.snp.makeConstraints {
            $0.centerY.equalTo(leftLabel)
            $0.trailing.equalToSuperview().inset(50)
            $0.size.equalTo(iconView)
        }
        
        rightLabelCell.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }

    // MARK: - Configuration

    override func configuration(data: CellSetups) {
        super.configuration(data: data)
        imageCell.image = data.rightImage
    }
}
