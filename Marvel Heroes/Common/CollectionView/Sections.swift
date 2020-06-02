//
//  Sections.swift
//  Pokedex
//
//  Created by Thiago Vaz on 02/04/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

class Sections {
    
    var items: [Any]
    
//    weak var delegate: HomeSectionDelegate?

    
    var visible: Bool = true
    
    var name: String
    
    init(items: [Any], name: String) {
        self.items = items
        self.name = name
    }

    
    var cellsSize: [String: CGSize] = [:]
    
    func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        return CollectionViewCell.self
    }
    
    func header() -> CollectionViewHeader.Type? {
        return nil
    }
    
    func footer() -> CollectionViewFooter.Type? {
       return CollectionViewFooter.self
    }
    func direction() -> UICollectionView.ScrollDirection {
       return .vertical
    }
    
    func willDisplayHeader(_ headerView: CollectionViewHeader) {}
    
    func willDisplayCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {}
    
    func didEndDisplayingCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {}
    
    func string(for cell: CollectionViewCell.Type, from indexPath: IndexPath) -> String {
        return "\(indexPath.section)-\(cell.identifier)"
    }
    
    func getCellSize(_ cell: CollectionViewCell.Type, for indexPath: IndexPath) -> CGSize {
        return cellsSize[string(for: cell, from: indexPath)] ?? .zero
    }
    
    func setCell(_ cell: CollectionViewCell.Type, size: CGSize, for indexPath: IndexPath) {
        cellsSize[string(for: cell, from: indexPath)] = size
    }
    
    func didSelectCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {}
    
    func shouldHighlight(at indexPath: IndexPath) -> Bool {
        return false
    }
    func willDisplayFooter(_ footerView: CollectionViewFooter) {}
    
    func requestAds(_ cell: CollectionViewCell, at indexPath: IndexPath) {}
    
    func insetForSection() -> UIEdgeInsets {
        return .zero
    }
    func cellLineSpace(collectionWidth: CGFloat) -> CGFloat {
        return 0
    }
    
    func paginate(_ cell: CollectionViewCell) {}
    
    func cellWidth(collectionWidth: CGFloat) -> CGFloat {
        return collectionWidth
    }
    
    func viewDidLoad() {}
    
    func viewWillAppear() {}
    
    func viewDidDisappear() {
        visible = false
    }

    func viewDidAppear() {
        visible = true
    }
    
    func isLastIndexPathOfSection(index: Int) -> Bool {
        if self.items.count == index + 1 {
            return true
        } else {
            return false
        }
    }
}
