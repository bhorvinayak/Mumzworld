//
//  ProductDetailsViewController.swift
//  Mumzworld
//
//  Created by Vinayak Bhor on 23/11/19.
//  Copyright © 2019 Vinayak Bhor. All rights reserved.
//

import UIKit
import Kingfisher
class ProductDetailsViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    var productOfferTag = ""
    var productDescTag = ""
    var productImgUrl = ""
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productDescLbl: UILabel!
    
    @IBOutlet weak var offerDescriptionLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("\(productImgUrl)")
        if productDescTag != ""{
            productDescLbl.attributedText = productDescTag.htmlToAttributedString
        }else{
            productDescLbl.text = "NA"
        }
        
        if productOfferTag != ""{
            
            offerDescriptionLbl.attributedText = productOfferTag.htmlToAttributedString
            }else{
            offerDescriptionLbl.text = "NA"
        }
        
        productImageView.kf.setImage(with: URL(string:"\(productImgUrl)"))
    }
    

    @IBAction func addToBagBarBtn(_ sender: UIBarButtonItem) {
    }
    

}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}

