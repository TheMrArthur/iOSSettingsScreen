//
//  SettingsViewController.swift
//  iOSSettingsScreen HW13
//
//  Created by Артур Горлов on 28.08.2022.
//

import UIKit
import SnapKit

final class SettingsViewController: UIViewController {

    var setupSections: [SetupSections]?

    // MARK: - UI Elements

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = .black
        tableView.separatorColor = .darkGray
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 55, bottom: 0, right: 0)
        tableView.register(DefaultTableViewCell.self, forCellReuseIdentifier: "defaultCell")
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: "switchCell")
        tableView.register(LabelTableViewCell.self, forCellReuseIdentifier: "labelCell")
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: "imageCell")
        tableView.register(PersonalTableViewCell.self, forCellReuseIdentifier: "personalCell")
        tableView.register(FindingTableViewCell.self, forCellReuseIdentifier: "findingCell")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        viewWillAppear(true)
        setupSections = SetupSections.setupSections
        title = "Настройки"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = .black
        setupHierarchy()
        setupLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    // MARK: - Setup View

    private func setupHierarchy() {
        view.addSubview(tableView)
    }

    private func setupLayout() {
        tableView.snp.makeConstraints {
            $0.top.trailing.bottom.leading.equalTo(view)
        }
    }
}
