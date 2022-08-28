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
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
