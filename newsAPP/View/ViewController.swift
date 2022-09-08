//
//  ViewController.swift
//  newsAPP
//
//  Created by Cenk Bahadır Çark on 8.09.2022.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var newsList: [News]? = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        getNewsArray { news in
            self.newsList = news
            self.collectionView.reloadData()
        }
    }
    
    private func getNewsArray(completion: @escaping (([News]) -> ())){
        let url = "https://api.currentsapi.services/v1/latest-news?apiKey=obc5wxVw27oQMMx3NFspff7lQgcTNBIZKmiFoXDB052JNE7I"
        
        NetworkService.shared.fetchNews(url: url) { response in
            
            guard let news = response.news else { return }
            completion(news)
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewCell", for: indexPath) as? NewsCell {
            
            cell.configureCell(news: cell)
            cell.setNews(news: self.newsList![indexPath.row])
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let urls = newsList?[indexPath.row]
        
        if let url = URL(string: (urls?.url) ?? ""){
            UIApplication.shared.open(url)
        }
         
        
        
    }
}
