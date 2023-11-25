//
//  Images_Pagging_VC.swift
//  Demo1
//
//  Created by Hetaksh Ghoghari on 11/22/23.
//

import UIKit

class Images_Pagging_VC: UIViewController {

    var UserInfo : UserData = UserData()
    
    @IBOutlet weak var CollectionView : UICollectionView!
    let Images : [String] = ["image001","image002","image003","image004","image005"]
//    let Images : [String] = ["1","2","3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userData()
    }
    
    private func userData()
    {
        self.CollectionView.delegate = self
        self.CollectionView.dataSource = self
    }
    
    @IBAction func UserProfile(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LogoutVC") as! LogoutVC
        vc.UserDetail = UserInfo
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension Images_Pagging_VC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "ImagesCell", for: indexPath) as! ImagesCell
        cell.images.image = UIImage(named: Images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        let height = 700
//        let height = 700
//        let width = self.CollectionView.frame.size.width/3 - 20
////        return CGSize(width: width, height: height )
//        return CGSize(width: width, height: height)
        
        
//        let width = self.CollectionView.frame.size.width
        let width = ScreenSize.width
        let height = (ScreenSize.width * 700) / 375
        return CGSize(width: width , height: height)
                

    }
}
