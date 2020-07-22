//
//  CollectionTableCell.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 22/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import UIKit
import SDWebImageSVGKitPlugin

class CollectionTableCell: UITableViewCell {

    // MARK: - Properties
    private(set) weak var iconImageView: UIImageView!
    private(set) weak var nameLabel: UILabel!
    private(set) weak var symbolLabel: UILabel!
    private(set) weak var detailsLabel: UILabel!
    

    // MARK: Init
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
        iconImageView.snp.makeConstraints {
            $0.height.width.equalTo(48)
        }

        let nameTitle = UILabel()
        nameTitle.font = UIFont.boldSystemFont(ofSize: 16)
        let symbolLabel = UILabel()
        symbolLabel.font = UIFont.systemFont(ofSize: 14)
        let detailsLabel = UILabel()
        detailsLabel.font = UIFont.systemFont(ofSize: 14)
        
        let titleStack = [iconImageView, nameTitle]
            .stacked(axis: .horizontal)
        
        let bottomStack = [symbolLabel, detailsLabel]
            .stacked(axis: .horizontal)
        
        let mainStack = [titleStack, bottomStack]
            .stacked(axis: .vertical)
        
        contentView.addSubview(mainStack)
        mainStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        self.iconImageView = iconImageView
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
    }
}

// MARK: - Private
extension CollectionTableCell {
    private func loadDataForCryptocoin(_ model: CollectionBaseProtocol) {
        guard  let model = model as? CryptocoinModel else {
            return
        }
        
        // TODO: - Search for more alternatives - this one and Kingfisher does not work for svg
//        iconImageView.sd_setImage(with: URL(string: "https://image.flaticon.com/icons/png/512/1205/1205526.png"), placeholderImage: UIImage(named: "placeholder.png"))
        iconImageView.sd_setImage(with: URL(string: "https://upload.wikimedia.org/wikipedia/commons/9/9e/Capi_x_Raven.svg"), placeholderImage: UIImage(named: "placeholder.png"))
        
        nameLabel.text = model.name
        symbolLabel.text = model.symbol
        detailsLabel.text = model.price
    }
    
    private func loadDataForComodity(_ model: CollectionBaseProtocol) {
        guard  let model = model as? CommodityModel else {
            return
        }
        
        iconImageView.sd_setImage(with: URL(string: model.logo), placeholderImage: UIImage(named: "placeholder.png"))
        nameLabel.text = model.name
        symbolLabel.text = model.symbol
        detailsLabel.text = model.price
    }
    
    private func loadDataForFiats(_ model: CollectionBaseProtocol) {
        guard  let model = model as? FiatModel else {
            return
        }
        
        iconImageView.sd_setImage(with: URL(string: model.logo), placeholderImage: UIImage(named: "placeholder.png"))
        nameLabel.text = model.name
        symbolLabel.text = model.symbol
    }
    
    private func loadDataForWallets(_ model: CollectionBaseProtocol) {
        
        // TO DO: - find a nicer way
        if let walletModel = model as? WalletModel {
            symbolLabel.text = walletModel.cryptocoinSymbol
            detailsLabel.text = walletModel.balance
        }
        
        if let commodityWalletModel = model as? CommodityWalletModel {
            symbolLabel.text = commodityWalletModel.cryptocoinSymbol
            detailsLabel.text = commodityWalletModel.balance
        }

        // TODO: - Missing logo from json - to discuss
        iconImageView.sd_setImage(with: nil, placeholderImage: UIImage(named: "placeholder.png"))
        nameLabel.text = model.name
    }
    
    private func loadDataForFiatWallets(_ model: CollectionBaseProtocol) {
        guard  let model = model as? FiatWalletModel else {
            return
        }
        
        // TODO: - Missing logo from json - to discuss
        iconImageView.sd_setImage(with: nil, placeholderImage: UIImage(named: "placeholder.png"))
        nameLabel.text = model.name
        symbolLabel.text = model.fiatSymbol
        detailsLabel.text = model.balance
    }
}

