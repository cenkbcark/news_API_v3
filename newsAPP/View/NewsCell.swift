//
//  NewsCell.swift
//  newsAPP
//
//  Created by Cenk Bahadır Çark on 8.09.2022.
//

import UIKit
import SDWebImage

class NewsCell: UICollectionViewCell {
    @IBOutlet weak private var newImage: UIImageView!
    @IBOutlet weak private var newTitle: UILabel!
    
    func setNews(news: News) {
        newTitle.text = news.title
        if news.image == "None" {
            newImage.sd_setImage(with: URL(string: "https://www.creativefabrica.com/wp-content/uploads/2018/12/Breaking-News-Vector-Illustration-by-indostudio-580x386.jpg"))
        }else{
            newImage.sd_setImage(with: URL(string: news.image!))
        }
    }
    
    func configureCell(news: NewsCell) {
        news.layer.cornerRadius = 20.0
    }
}

