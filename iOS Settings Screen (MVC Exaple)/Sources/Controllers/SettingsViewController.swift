//
//  SettingsViewController.swift
//  iOSSettingsScreen HW13
//
//  Created by Артур Горлов on 12.09.2022.
//

import UIKit
import SnapKit

final class SettingsViewController: UIViewController {

    private var tableView: TableView? {
        guard isViewLoaded else { return nil }
        return view as? TableView
    }

    override func loadView() {
        view = TableView()
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = .black
        tableView?.tableView.dataSource = self
        tableView?.tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return SetupSections.setupSections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SetupSections.setupSections[section].setupItem.count
    }

    func universalCell<T: UITableViewCell>(cell: T,
                                           accessoryType: UITableViewCell.AccessoryType,
                                           _ indexPath: IndexPath,
                                           _ tableView: UITableView) -> T {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(T.self)", for: indexPath) as? T
        else { return UITableViewCell() as? T ?? cell }
        return cell
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let content = SetupSections.setupSections[indexPath.section].setupItem[indexPath.row]

        switch content.cellType {
            case .defaultCell:
                let cell = universalCell(cell: DefaultTableViewCell(), accessoryType: .disclosureIndicator, indexPath, tableView)
                cell.configuration(data: content)
                return cell
            case .switchCell:
                let cell = universalCell(cell: SwitchTableViewCell(), accessoryType: .disclosureIndicator, indexPath, tableView)
                cell.configuration(data: content)
                cell.selectionStyle = .none
                cell.accessoryView = nil
                return cell
            case .labelCell:
                let cell = universalCell(cell: LabelTableViewCell(), accessoryType: .disclosureIndicator, indexPath, tableView)
                cell.configuration(data: content)
                return cell
            case .imageCell:
                let cell = universalCell(cell: ImageTableViewCell(), accessoryType: .disclosureIndicator, indexPath, tableView)
                cell.configuration(data: content)
                return cell
            case .personalInfoCell:
                let cell = universalCell(cell: PersonalTableViewCell(), accessoryType: .disclosureIndicator, indexPath, tableView)
                cell.configuration(data: content)
                return cell
            case .findingCell:
                let cell = universalCell(cell: FindingTableViewCell(), accessoryType: .disclosureIndicator, indexPath, tableView)
                cell.configuration(data: content)
                cell.accessoryView = nil
                cell.selectionStyle = .none
                return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let setups = SetupSections.setupSections[indexPath.section].setupItem[indexPath.row]

        func detailSettings() {
            let detailSettingsViewController = DetailSettingsViewController()
            tableView.deselectRow(at: indexPath, animated: true)
            detailSettingsViewController.viewSetups = setups
            navigationController?.pushViewController(detailSettingsViewController, animated: true)
        }

        switch setups.cellType {
            case .switchCell, .findingCell:
                return
            case .personalInfoCell:
                detailSettings()
                print("\(setups.personalName ?? "")")
            default:
                detailSettings()
                print("\(setups.nameCell ?? "")")
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch SetupSections.setupSections[indexPath.section].setupItem[indexPath.row].cellType {
            case .personalInfoCell:
                return 100
            case .findingCell:
                return 35
            default:
                return UITableView.automaticDimension
        }
    }
}
