//
//  WalletsController.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 21/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import UIKit

class WalletsController: UIViewController {

    private(set) weak var segmentedControlView: SegmentedControlView!
    private(set) var pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    private(set) var pages = [UIViewController]()
    private(set) var walletsViewModel = WalletsViewModel()
    private(set) var collectionsViewModel = CollectionsViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchCollections()
    }
    
    // MARK: - Navigation
    override var navigationItem: UINavigationItem {
        let item = super.navigationItem
        // TODO: - Add localization
        item.title = "Wallets"
        return item
    }
    
    // MARK: - Setup
    private func setupUI() {
        let segmentedControlView = SegmentedControlView()
        segmentedControlView.delegate = self
        segmentedControlView.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        
        let container = UIView()
        let mainStack = [segmentedControlView, container]
            .stacked(axis: .vertical)
        view.addSubview(mainStack)
        mainStack.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin)
            $0.leading.trailing.bottom.equalToSuperview()
        }

        self.segmentedControlView = segmentedControlView
        addChildViewController(pageViewController, in: container)
    }
    
    private func fetchCollections() {
        walletsViewModel.fetchWallets { [weak self] collections in
            DispatchQueue.main.async {
                guard let self = self else {
                    return
                }
                self.segmentedControlView.items = self.walletsViewModel.wallets.map { $0.title }
            }
        }
        
        collectionsViewModel.fetchWallets { [weak self] wallets in
            DispatchQueue.main.async {
                guard let self = self else {
                    return
                }
                let walletsController = AssetsTableViewController(data: self.collectionsViewModel.wallets)
                self.pages.append(walletsController)
                self.pageViewController.setViewControllers([self.pages[0]], direction: .forward, animated: false, completion: nil)
            }
        }
        
        collectionsViewModel.fetchCommodityWallets { [weak self] commodityWallets in
            DispatchQueue.main.async {
                guard let self = self else {
                    return
                }
                let commodityWalletsController = AssetsTableViewController(data: self.collectionsViewModel.commodityWallets)
                self.pages.append(commodityWalletsController)
            }
        }
        
        collectionsViewModel.fetchFiatWallets { [weak self] fiatWallets in
            DispatchQueue.main.async {
                guard let self = self else {
                    return
                }
                let fiatsWalletsController = AssetsTableViewController(data: self.collectionsViewModel.fiatWallets)
                self.pages.append(fiatsWalletsController)
            }
        }
    }
}


// MARK: - SegmentedControlViewDelegate
extension WalletsController: SegmentedControlViewDelegate {
    func segmentedControlViewDidSelectIndex(_ view: SegmentedControlView, index: Int) {
        guard index < pages.count else {
            return
        }

        pageViewController.setViewControllers([pages[index]], direction: .forward, animated: false, completion: nil)
    }
}
