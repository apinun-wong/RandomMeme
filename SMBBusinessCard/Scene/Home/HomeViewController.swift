//
//  HomeViewController.swift
//  MVVM+Clean
//
//  Created by Apinun on 9/7/2566 BE.
//

import UIKit

final class HomeViewController: BaseViewController<HomeViewModel> {
    @IBOutlet weak var tableView: UITableView!
    var dataSource: UITableViewDiffableDataSource<HomeSection, HomeItemType>? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpTableView()
        bindOutputs()
        viewModel.input.viewDidLoad?()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.input.viewWillAppear?()
    }
    
    private func setUpUI() {
        self.title = "All HTTP Status"
    }
    
    private func setUpTableView() {
        tableView.registerNib(type: HomeTableViewCell.self)
        tableView.registerNibHeaderFooter(type: HomeTitleUITableViewHeaderFooterView.self)
        tableView.delegate = self
        dataSource = UITableViewDiffableDataSource<HomeSection, HomeItemType>(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            if let cell: HomeTableViewCell = tableView.dequeueReusableCell() {
                cell.setUp(item: itemIdentifier)
               return cell
            }
            return UITableViewCell()
        })
    }
    
    private func bindOutputs() {
        self.viewModel.output.setUpItems = { [weak self] sections in
            guard let self else { return }
            var snapshot = NSDiffableDataSourceSnapshot<HomeSection, HomeItemType>()
            snapshot.appendSections(sections)
            sections.forEach { section in
                snapshot.appendItems(section.items, toSection: section)
            }
            self.dataSource?.apply(snapshot)
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HomeTitleUITableViewHeaderFooterView(reuseIdentifier: "HomeTitleUITableViewHeaderFooterView")
        let title = viewModel.output.getHeaderTitle(section: section) ?? ""
        headerView.setUp(title: title)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.input.selectItem(indexPath: indexPath)
    }
}
