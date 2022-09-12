//
//  DetailView.swift
//  iOS Settings Screen (MVC Exaple)
//
//  Created by Артур Горлов on 12.09.2022.
//

import UIKit
import SnapKit

final class DetailView: UIView {
    
    // MARK: - Initialisers

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
