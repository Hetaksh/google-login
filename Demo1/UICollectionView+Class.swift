//
//  UICollectionView+Class.swift
//  MVVMBasicStructure
//
//  Created by KISHAN_RAJA on 22/09/20.
//  Copyright © 2020 KISHAN_RAJA. All rights reserved.
//

import UIKit

class DynamicCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        var size = contentSize
        size.height += (contentInset.top + contentInset.bottom)
        size.width += (contentInset.left + contentInset.right)
        return size
    }
}

class AutoSizedCollectionView: UICollectionView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    
    deinit {
        self.removeObserver(self, forKeyPath: "contentSize")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize", let collection = object as? UICollectionView
        {
            collection.constraints.filter({$0.firstAttribute == .height}).first?.constant = collection.collectionViewLayout.collectionViewContentSize.height
        }
    }
}

class AutoWidthCollectionView: UICollectionView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    
    deinit {
        self.removeObserver(self, forKeyPath: "contentSize")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize", let collection = object as? UICollectionView
        {
            collection.constraints.filter({$0.firstAttribute == .width}).first?.constant = collection.contentSize.width
        }
    }
}

