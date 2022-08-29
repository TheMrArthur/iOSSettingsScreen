//
//  DetailSettingsViewController.swift
//  iOSSettingsScreen HW13
//
//  Created by Артур Горлов on 28.08.2022.
//

import UIKit
import SnapKit

final class DetailSettingsViewController: UIViewController {

    var viewSetups: CellSetups?

    private func fillSettings() {
        if viewSetups?.personalName != nil {
            title = viewSetups?.personalName
        } else {
            title = viewSetups?.nameCell
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        fillSettings()
    }
}
