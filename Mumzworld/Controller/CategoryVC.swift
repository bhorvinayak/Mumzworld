//
//  CategoryVC.swift
//  Mumzworld
//
//  Created by Vinayak Bhor on 23/11/19.
//  Copyright © 2019 Vinayak Bhor. All rights reserved.
//

import UIKit
import Kingfisher
class CategoryVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
   
    var offersArray = [Offers]()
    var offers = Array<Off>()
    var defaults = UserDefaults.standard
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
  
    var productNameArray = [String]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
       
        activityIndicator.isHidden = true
        print(dataFilePath)
        fetchJsonData()
        productsCollectionView.reloadData()
    }
    func fetchJsonData(){

        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        if let path = Bundle.main.path(forResource: "document", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                
                do {
                    let decoder = JSONDecoder()
                    let offerData = try decoder.decode(ShoppingOffers.self, from: data)
                    print("offerData : \(offerData)")
                    
                     DispatchQueue.main.async {
                        
                        if offerData.result?.offers?.count != 0{
                            
                            for i in 0...(offerData.result?.offers?.count)!-1{
                                self.offers.append((offerData.result?.offers?[i])!)
                                
                            }
                            
                            self.productsCollectionView.reloadData()
                            self.activityIndicator.stopAnimating()
                            self.activityIndicator.isHidden = true
                        }
                            
                        }
                    
                    }
                    
                
                } catch {
                    print("Error:",error)
                }
        }else {
            print("Invalid filename/path.")
        }
        
       
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return offers.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Cell_Identifier = "Cell"
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell_Identifier, for: indexPath) as! ProductCollectionViewCell
        
        cell.productNameLbl.text! = offers[indexPath.row].productName ?? "NA"
        cell.productImageView.kf.setImage(with: URL(string:"\(offers[indexPath.row].wideImageURL!)"))
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let Cell_Identifier = "Cell"
        
        let productDetails:ProductDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailsVC") as! ProductDetailsViewController
        productDetails.productOfferTag = offers[indexPath.row].productDescription ?? "NA"
        productDetails.productDescTag = offers[indexPath.row].long_desc ?? "NA"
        productDetails.productImgUrl = offers[indexPath.row].wideImageURL ?? ""; self.navigationController?.pushViewController(productDetails, animated: true)
    }


}
