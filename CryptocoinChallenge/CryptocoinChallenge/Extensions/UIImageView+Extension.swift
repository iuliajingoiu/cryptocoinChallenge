//
//  UIImageView+Extension.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 26/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import SVGKit

extension UIImageView {
    func loadSvg(from string: String?, placeholder: UIImage?) {
        guard let urlString = string, let url = URL(string: urlString) else {
            self.image = placeholder
            return
        }
        contentMode = .scaleAspectFit
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let receivedicon: SVGKImage = SVGKImage(data: data),
                let image = receivedicon.uiImage
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
}
