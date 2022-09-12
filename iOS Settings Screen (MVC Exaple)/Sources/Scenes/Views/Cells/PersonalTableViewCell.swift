//
//  PersonalTableViewCell.swift
//  iOSSettingsScreen HW13
//
//  Created by Артур Горлов on 12.09.2022.
//

import UIKit
import SnapKit

class PersonalTableViewCell: DefaultTableViewCell {

    override var cellSetups: CellSetups? {
        didSet {
            personalImage.image = cellSetups?.personalImage
            personalNameLabel.text = cellSetups?.personalName
        }
    }

    // MARK: - UI Elements

    private lazy var personalImage: UIImageView = {
        let personalImage = UIImageView()
        personalImage.contentMode = .scaleAspectFill
        personalImage.clipsToBounds = true
        personalImage.layer.cornerRadius = 29
        return personalImage
    }()

    private lazy var infoImage: UIImageView = {
        let infoImage = UIImageView()
        infoImage.backgroundColor = .yellow
        infoImage.layer.cornerRadius = 30
        infoImage.backgroundColor = .lightGray
        return infoImage
    }()

    private lazy var personalNameLabel: UILabel = {
        let personalNameLabel = UILabel()
        personalNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        personalNameLabel.textColor = .white
        return personalNameLabel
    }()

    private lazy var infoLabel: UILabel = {
        let infoLabel = UILabel()
        infoLabel.text = "Apple ID, iCloud, контент и покупки"
        infoLabel.textColor = .white
        infoLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return infoLabel
    }()

    private lazy var infoStack: UIStackView = {
        let infoStack = UIStackView()
        infoStack.alignment = .leading
        infoStack.axis = .vertical
        infoStack.distribution = .fill
        infoStack.spacing = 5
        return infoStack
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
        addSubview(infoImage)
        addSubview(infoStack)

        infoImage.addSubview(personalImage)

        infoStack.addArrangedSubview(personalNameLabel)
        infoStack.addArrangedSubview(infoLabel)
    }

    private func setupLayout() {

        infoImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(60)

        }

        personalImage.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
            $0.size.equalToSuperview().inset(0.5)
        }

        infoStack.snp.makeConstraints {
            $0.centerY.equalTo(infoImage)
            $0.leading.equalTo(infoImage.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().inset(10)
        }
    }
}
