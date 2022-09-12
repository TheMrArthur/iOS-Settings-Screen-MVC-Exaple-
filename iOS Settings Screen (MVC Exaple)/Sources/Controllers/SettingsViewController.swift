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

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell") as? DefaultTableViewCell
        cell?.cellSetups = SetupSections.setupSections[indexPath.section].setupItem[indexPath.row]
        cell?.accessoryType = .disclosureIndicator

        let switchTableCell = tableView.dequeueReusableCell(withIdentifier: "switchCell") as? SwitchTableViewCell
        switchTableCell?.cellSetups = SetupSections.setupSections[indexPath.section].setupItem[indexPath.row]
        switchTableCell?.selectionStyle = .none
        switchTableCell?.accessoryView = nil

        let labelTableCell = tableView.dequeueReusableCell(withIdentifier: "labelCell") as? LabelTableViewCell
        labelTableCell?.cellSetups = SetupSections.setupSections[indexPath.section].setupItem[indexPath.row]
        labelTableCell?.accessoryType = .disclosureIndicator

        let imageTableCell = tableView.dequeueReusableCell(withIdentifier: "imageCell") as? ImageTableViewCell
        imageTableCell?.cellSetups = SetupSections.setupSections[indexPath.section].setupItem[indexPath.row]
        imageTableCell?.accessoryType = .disclosureIndicator

        let personalTableCell = tableView.dequeueReusableCell(withIdentifier: "personalCell") as? PersonalTableViewCell
        personalTableCell?.cellSetups = SetupSections.setupSections[indexPath.section].setupItem[indexPath.row]
        personalTableCell?.accessoryType = .disclosureIndicator

        let findingTableCell = tableView.dequeueReusableCell(withIdentifier: "findingCell") as? FindingTableViewCell
        findingTableCell?.cellSetups = SetupSections.setupSections[indexPath.section].setupItem[indexPath.row]
        findingTableCell?.accessoryView = nil
        findingTableCell?.selectionStyle = .none

        switch SetupSections.setupSections[indexPath.section].setupItem[indexPath.row].cellType {
            case .defaultCell:
                return cell ?? UITableViewCell()
            case .switchCell:
                return switchTableCell ?? UITableViewCell()
            case .labelCell:
                return labelTableCell ?? UITableViewCell()
            case .imageCell:
                return imageTableCell ?? UITableViewCell()
            case .personalInfoCell:
                return personalTableCell ?? UITableViewCell()
            case .findingCell:
                return findingTableCell ?? UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        func detailSettings() {
            let detailSettingsViewController = DetailSettingsViewController()
            tableView.deselectRow(at: indexPath, animated: true)
            detailSettingsViewController.viewSetups = SetupSections.setupSections[indexPath.section].setupItem[indexPath.row]
            navigationController?.pushViewController(detailSettingsViewController, animated: true)
        }

        switch SetupSections.setupSections[indexPath.section].setupItem[indexPath.row].cellType {
            case .switchCell, .findingCell:
                return
            case .personalInfoCell:
                detailSettings()
                print("\(SetupSections.setupSections[indexPath.section].setupItem[indexPath.row].personalName ?? "")")
            default:
                detailSettings()
                print("\(SetupSections.setupSections[indexPath.section].setupItem[indexPath.row].nameCell ?? "")")
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
