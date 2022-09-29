//
//  ProductsTabViewController.swift
//  ShockMarket
//
//  Created by Abdurrahman Gazi Yavuz on 29.09.2022.
//

import UIKit

class ProductsTabViewController: UIViewController {
    
    private var products: [Product] = [Product]()
    
    private let productsCollectionView: UICollectionView = {
       
        let layout              = UICollectionViewFlowLayout()
        layout.itemSize         = CGSize(width: 60, height: 80)
        layout.scrollDirection  = .vertical
        let collectionView      = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(SingleProductCollectionViewCell.self, forCellWithReuseIdentifier: SingleProductCollectionViewCell.identifier)
        
        return collectionView
        
    }()
    
    private func fetchProducts(){
        
        APICaller.shared.getProducts { [weak self] result in
            switch result {
            case .success(let result):
                print(result.products.count)
                self?.products  = Array(result.products[0...20])
//                self?.products  = result.products
                self?.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    private func reloadData(){
        DispatchQueue.main.async {
            [weak self] in self?.productsCollectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
            
        // Do any additional setup after loading the view.
        
        view.addSubview(productsCollectionView)
        
        productsCollectionView.delegate         = self
        productsCollectionView.dataSource       = self
        
        fetchProducts()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        productsCollectionView.frame    = view.bounds
    }

}


extension ProductsTabViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: SingleProductCollectionViewCell.identifier, for: indexPath) as? SingleProductCollectionViewCell else {return UICollectionViewCell()}
        
        guard let thumbnail = products[indexPath.row].image_types?.mini else {return UICollectionViewCell()}
        guard let url       = products[indexPath.row].images[0].url else {return UICollectionViewCell()}

        cell.configure(with: thumbnail + url)
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
}
