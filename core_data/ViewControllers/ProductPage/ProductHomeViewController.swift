//
//  ProductHomeViewController.swift
//  core_data
//
//  Created by artmac on 12/11/24.
//

import UIKit

class ProductHomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let apiManager = ApiManager.shared
    
    var homeData: HomeModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeCollectionView()
        callHomeApi()
    }
    
    func initializeCollectionView(){
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
            collectionView?.register(nib, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        self.collectionView.register(SectionHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeaderCollectionReusableView")
    }
    
    
    func callHomeApi(){
        apiManager.callProductAPi(url: BaseUrl + Endpoint.home.value) { result in
            switch result{
            case .success(let data):
                
                self.homeData = data
                self.collectionView.reloadData()
                
                
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension ProductHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0:
            if let flashSale = self.homeData?.data?.flashSale{
                return flashSale.count
            }
            
        case 1:
            if let recommended = self.homeData?.data?.recommended{
                return recommended.count
            }
        case 2:
            if let newProducts = self.homeData?.data?.newProduct{
                return newProducts.count
            }
        default:
            return 0
        }
        return 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section{
        case 0:
            if let flashSale = self.homeData?.data?.flashSale{
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell else {return UICollectionViewCell()}
                
                cell.configCell(with: flashSale[indexPath.row])
                return cell
            }
        case 1:
            if let recommended = self.homeData?.data?.recommended{
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell else{
                    return UICollectionViewCell()
                }
                cell.configCell(with: recommended[indexPath.row])
                return cell
                        
            }
        case 2:
            if let newProduct = self.homeData?.data?.newProduct{
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell else{
                    return UICollectionViewCell()
                }
                cell.configCell(with: newProduct[indexPath.row])
                return cell
                        
            }
            
        default:
            return UICollectionViewCell()
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionHeader:
            if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeaderCollectionReusableView", for: indexPath) as? SectionHeaderCollectionReusableView{
                sectionHeader.sectionHeader.text = "Section \(indexPath.section)"
                    return sectionHeader
                }
        default:
            return UICollectionReusableView()
        }
       return  UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.width/2
        return CGSize(width: size - 10, height: size + 10)
    }
    
}






