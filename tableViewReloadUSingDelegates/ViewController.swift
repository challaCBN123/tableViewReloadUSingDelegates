//
//  ViewController.swift
//  tableViewReloadUSingDelegates
//
//  Created by Bhargava on 12/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {
    @IBOutlet weak var clView:UICollectionView!
    var dataArray = [[String:Any]]()
    let baseURl = "http://jsonplaceholder.typicode.com/"
    let serviceURl = "photos"
    override func viewDidLoad() {
        super.viewDidLoad()
        gettingData()
        clView.dataSource = self
        clView.delegate = self
           
    }
    func gettingData(){
        gettingImageData.services.getImagesFromUrl(baseUrl: baseURl, serviceUrl: serviceURl, encoding: JSONEncoding.default) { (response, err) in
            print(response)
            self.dataArray = response as! [[String : Any]]
            DispatchQueue.global().async {
                DispatchQueue.main.async {
                        self.clView.reloadData()
                }
            
            }
            //print(self.dataArray)
        }
        
    }
    
}
extension ViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = clView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath ) as! ImageCell
        let dict = dataArray[indexPath.row]
        cell.imageName.text = (dict["title"] as! String)
        let url = URL(string: dict["url"] as! String)
        if let imageData = try? Data(contentsOf: url!){
            cell.imageViewImage.image = UIImage(data: imageData)
        }
        
        return cell
    }
   
    
}
