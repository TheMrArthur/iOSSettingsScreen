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
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as? DefaultTableViewCell
        cell?.cellSetups = setupSections?[indexPath.section].setupItem[indexPath.row]
        cell?.accessoryType = .disclosureIndicator

        let switchTableCell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as? SwitchTableViewCell
        switchTableCell?.cellSetups = setupSections?[indexPath.section].setupItem[indexPath.row]
        switchTableCell?.selectionStyle = .none

        let labelTableCell = tableView.dequeueReusableCell(withIdentifier: "labelCell", for: indexPath) as? LabelTableViewCell
        labelTableCell?.cellSetups = setupSections?[indexPath.section].setupItem[indexPath.row]
        labelTableCell?.accessoryType = .disclosureIndicator

        let imageTableCell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as? ImageTableViewCell
        imageTableCell?.cellSetups = setupSections?[indexPath.section].setupItem[indexPath.row]
        imageTableCell?.accessoryType = .disclosureIndicator

        switch setupSections?[indexPath.section].setupItem[indexPath.row].cellType {
            case .defaultCell:
                return cell ?? UITableViewCell()
            case .switchCell:
                return switchTableCell ?? UITableViewCell()
            case .labelCell:
                return labelTableCell ?? UITableViewCell()
            case .imageCell:
                return imageTableCell ?? UITableViewCell()
            default:
                return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if setupSections?[indexPath.section].setupItem[indexPath.row].cellType != .switchCell {
            let detailSettingsViewController = DetailSettingsViewController()
            tableView.deselectRow(at: indexPath, animated: true)
            detailSettingsViewController.viewSetups = setupSections?[indexPath.section].setupItem[indexPath.row]
            navigationController?.pushViewController(detailSettingsViewController, animated: true)
            print("\(detailSettingsViewController.viewSetups?.nameCell ?? "")")
        }
    }
}
