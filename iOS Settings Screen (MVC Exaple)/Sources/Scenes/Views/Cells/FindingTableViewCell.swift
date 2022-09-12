//
//  FindingTableViewCell.swift
//  iOSSettingsScreen HW13
//
//  Created by Артур Горлов on 12.09.2022.
//

import UIKit
import SnapKit

class FindingTableViewCell: DefaultTableViewCell {

    // MARK: - UI Elements

    private lazy var findingTextField: UITextField = {
        let findingTextField = UITextField()
        findingTextField.textColor = .white

        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        findingTextField.leftView = leftView
        findingTextField.leftView?.tintColor = .lightGray
        let leftIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        leftIcon.frame = CGRect(x: 0, y: 3.5, width: 20, height: 20)
        leftView.addSubview(leftIcon)

        findingTextField.leftViewMode = .always
        findingTextField.attributedPlaceholder = NSAttributedString(string: "Поиск", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        findingTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return findingTextField
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

    // MARK: - Setup

    private func setupHierarchy() {
        contentView.addSubview(findingTextField)
    }

    private func setupLayout() {

        findingTextField.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().inset(10)
        }
    }
}
