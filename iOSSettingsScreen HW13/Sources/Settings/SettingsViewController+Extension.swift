//
//  SettingsViewController+Extension.swift
//  iOSSettingsScreen HW13
//
//  Created by Артур Горлов on 28.08.2022.
//

import UIKit

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return setupSections?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setupSections?[section].setupItem.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell") as? DefaultTableViewCell
        cell?.cellSetups = setupSections?[indexPath.section].setupItem[indexPath.row]
        cell?.accessoryType = .disclosureIndicator

        let switchTableCell = tableView.dequeueReusableCell(withIdentifier: "switchCell") as? SwitchTableViewCell
        switchTableCell?.cellSetups = setupSections?[indexPath.section].setupItem[indexPath.row]
        switchTableCell?.selectionStyle = .none
        switchTableCell?.accessoryView = nil

        let labelTableCell = tableView.dequeueReusableCell(withIdentifier: "labelCell") as? LabelTableViewCell
        labelTableCell?.cellSetups = setupSections?[indexPath.section].setupItem[indexPath.row]
        labelTableCell?.accessoryType = .disclosureIndicator

        let imageTableCell = tableView.dequeueReusableCell(withIdentifier: "imageCell") as? ImageTableViewCell
        imageTableCell?.cellSetups = setupSections?[indexPath.section].setupItem[indexPath.row]
        imageTableCell?.accessoryType = .disclosureIndicator

        let personalTableCell = tableView.dequeueReusableCell(withIdentifier: "personalCell") as? PersonalTableViewCell
        personalTableCell?.cellSetups = setupSections?[indexPath.section].setupItem[indexPath.row]
        personalTableCell?.accessoryType = .disclosureIndicator

        let findingTableCell = tableView.dequeueReusableCell(withIdentifier: "findingCell") as? FindingTableViewCell
        findingTableCell?.cellSetups = setupSections?[indexPath.section].setupItem[indexPath.row]
        findingTableCell?.accessoryView = nil
        findingTableCell?.selectionStyle = .none

        switch setupSections?[indexPath.section].setupItem[indexPath.row].cellType {
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
            default:
                return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        func detailSettings() {
            let detailSettingsViewController = DetailSettingsViewController()
            tableView.deselectRow(at: indexPath, animated: true)
            detailSettingsViewController.viewSetups = setupSections?[indexPath.section].setupItem[indexPath.row]
            navigationController?.pushViewController(detailSettingsViewController, animated: true)
        }

        switch setupSections?[indexPath.section].setupItem[indexPath.row].cellType {
            case .switchCell, .findingCell:
                return
            case .personalInfoCell:
                detailSettings()
                print("\(setupSections?[indexPath.section].setupItem[indexPath.row].personalName ?? "")")
            default:
                detailSettings()
                print("\(setupSections?[indexPath.section].setupItem[indexPath.row].nameCell ?? "")")
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard setupSections?[indexPath.section].setupItem[indexPath.row].cellType != .personalInfoCell else {
            return 100
        }

        guard setupSections?[indexPath.section].setupItem[indexPath.row].cellType != .findingCell else {
            return 35
        }

        return UITableView.automaticDimension
    }
}
