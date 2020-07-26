//
//  CollectionTableCell.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 22/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import UIKit

class CollectionTableCell: UITableViewCell {

    // MARK: - Properties
    private(set) weak var iconImageView: UIImageView!
    private(set) weak var defaultWalletImageView: UIImageView!
    private(set) weak var nameLabel: UILabel!
    private(set) weak var symbolLabel: UILabel!
    private(set) weak var detailsLabel: UILabel!
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Setup
    private func setupUI() {
        let iconImageView = UIImageView()
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.image = UIImage(named: "placeholder.png")
        iconImageView.snp.makeConstraints {
            $0.height.width.equalTo(48)
        }

        let defaultWalletImageView = UIImageView()
        defaultWalletImageView.contentMode = .scaleAspectFit
        defaultWalletImageView.snp.makeConstraints {
            $0.height.width.equalTo(16)
        }
        
        let nameTitle = UILabel()
        nameTitle.font = UIFont.boldSystemFont(ofSize: 16)
        let symbolLabel = UILabel()
        symbolLabel.font = UIFont.systemFont(ofSize: 14)
        let detailsLabel = UILabel()
        detailsLabel.font = UIFont.systemFont(ofSize: 14)
        
        let titleStack = [iconImageView, nameTitle, defaultWalletImageView]
            .stacked(axis: .horizontal)
            .alignment(.center)
            .spacing(8)
        
        let bottomStack = [symbolLabel, .spacing, detailsLabel]
            .stacked(axis: .horizontal)
        
        let mainStack = [titleStack, bottomStack]
            .stacked(axis: .vertical)
            .spacing(8)
        
        contentView.addSubview(mainStack)
        mainStack.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }

        self.iconImageView = iconImageView
        self.defaultWalletImageView = defaultWalletImageView
        self.nameLabel = nameTitle
        self.symbolLabel = symbolLabel
        self.detailsLabel = detailsLabel
    }
    
    func setupWith(model: CollectionBaseProtocol) {
        guard let type = model.type else {
            return
        }
        
        let collectionType = CollectionType(rawValue: type)
        switch collectionType {
        case .cryptocoin:
            loadDataForCryptocoin(model)
        case .commodity:
            loadDataForComodity(model)
        case .fiat:
            loadDataForFiats(model)
        case .wallet:
            loadDataForWallets(model)
        case .fiatWallet:
            loadDataForFiatWallets(model)
        default:
            break
        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.nameLabel.text = nil
        self.symbolLabel.text = nil
        self.detailsLabel.text = nil
        self.defaultWalletImageView.image = nil
        self.iconImageView.image = nil
    }
}

// MARK: - Private
extension CollectionTableCell {
    private func loadDataForCryptocoin(_ model: CollectionBaseProtocol) {
        guard  let model = model as? CryptocoinModel else {
            return
        }
    
        nameLabel.text = model.name
        symbolLabel.text = model.symbol
        detailsLabel.text = model.formattedPrice
        iconImageView.loadSvg(from: model.logo, placeholder: UIImage(named: "placeholder.png"))
    }
    
    private func loadDataForComodity(_ model: CollectionBaseProtocol) {
        guard  let model = model as? CommodityModel else {
            return
        }
    
        nameLabel.text = model.name
        symbolLabel.text = model.symbol
        detailsLabel.text = model.formattedPrice
        iconImageView.loadSvg(from: model.logo, placeholder: UIImage(named: "placeholder.png"))
    }
    
    private func loadDataForFiats(_ model: CollectionBaseProtocol) {
        guard  let model = model as? FiatModel else {
            return
        }
        
        iconImageView.loadSvg(from: model.logo, placeholder: UIImage(named: "placeholder.png"))
        nameLabel.text = model.name
        symbolLabel.text = model.symbol
    }
    
    private func loadDataForWallets(_ model: CollectionBaseProtocol) {
        
        // TO DO: - find a nicer way
        if let walletModel = model as? WalletModel {
            symbolLabel.text = walletModel.cryptocoinSymbol
            detailsLabel.text = walletModel.balance
            if walletModel.isDefault {
                defaultWalletImageView.image = UIImage(named: "defaultWallet.png")
            }
            
            if let asset = DataManager.sharedInstance.cryptocoins
                .first(where: ({ $0.id == walletModel.cryptocoinId })) {
                    iconImageView.loadSvg(from: asset.attributes.logo, placeholder: UIImage(named: "placeholder.png"))
            }
        }
        
        if let commodityWalletModel = model as? CommodityWalletModel {
            symbolLabel.text = commodityWalletModel.cryptocoinSymbol
            detailsLabel.text = commodityWalletModel.balance
            if commodityWalletModel.isDefault {
                defaultWalletImageView.image = UIImage(named: "defaultWallet.png")
            }
            
            if let asset = DataManager.sharedInstance.commodities
                .first(where: ({ $0.id == commodityWalletModel.cryptocoinId })) {
                    iconImageView.loadSvg(from: asset.attributes.logo, placeholder: UIImage(named: "placeholder.png"))
            }
        }

        nameLabel.text = model.name
    }
    
    private func loadDataForFiatWallets(_ model: CollectionBaseProtocol) {
        guard  let model = model as? FiatWalletModel else {
            return
        }
    
        iconImageView.loadSvg(from: nil, placeholder: UIImage(named: "placeholder.png"))
        nameLabel.text = model.name
        symbolLabel.text = model.fiatSymbol
        detailsLabel.text = model.balance
        
        if let asset = DataManager.sharedInstance.fiats
            .first(where: ({ $0.id == model.fiatId })) {
                iconImageView.loadSvg(from: asset.attributes.logo, placeholder: UIImage(named: "placeholder.png"))
        }
    }
}

