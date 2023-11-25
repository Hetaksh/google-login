//
//  ViewControllerVM.swift
//  Demo1
//
//  Created by Hetaksh Ghoghari on 11/22/23.
//

import UIKit
import Foundation

class ViewControllerVM
{
    private(set) var arrList : [ImageModel] = []

    //MARK:- Init
    init() {
        self.arrList.append(ImageModel(image: UIImage(named: "image001")!))
        self.arrList.append(ImageModel(image: UIImage(named: "image002")!))
        self.arrList.append(ImageModel(image: UIImage(named: "image003")!))
    }

    //MARK:- Deinit
    deinit {
        debugPrint("‼️‼️‼️ deinit view model : \(self) ‼️‼️‼️")
    }
}
//
extension ViewControllerVM {

    /// Get list count.
    /// - Returns: Return list count.
    func numberOfItems() -> Int {
        self.arrList.count
    }

    /// Get list row.
    /// - Parameter index: Collection index.
    /// - Returns: Return List object data.
    func getItem(for index: Int) -> ImageModel {
        self.arrList[index]
    }
}
