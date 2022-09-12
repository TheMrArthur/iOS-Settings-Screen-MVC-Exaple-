//
//  DetailSettingsViewController.swift
//  iOSSettingsScreen HW13
//
//  Created by Артур Горлов on 12.09.2022.
//

import UIKit
import SnapKit

final class DetailSettingsViewController: UIViewController {

    var viewSetups: CellSetups?

    private var detailView: DetailView? {
        guard isViewLoaded else { return nil }
        return view as? DetailView
    }

    private func fillSettings() {
        if viewSetups?.personalName != nil {
            title = viewSetups?.personalName
        } else {
            title = viewSetups?.nameCell
        }
    }

    // MARK: - Lifecycle
    
    override func loadView() {
        view = DetailView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        fillSettings()
    }
}
