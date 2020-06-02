//
//  CollectionViewController.swift
//  Pokedex
//
//  Created by Thiago Vaz on 03/04/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    var storedOffsets = [Int: CGFloat]()
    
    var sections = [Sections]() {
        didSet {
            collectionView.isHidden = false
            configure()
            collectionView.reloadData()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        configure()
       _ = sections.map({ $0.viewDidLoad() })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
       _ = sections.map({ $0.viewDidDisappear() })
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      _ = sections.map({ $0.viewWillAppear() })
//        collectionView.deselectItem(along: transitionCoordinator)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        _ = sections.map({ $0.viewDidAppear() })
//        collectionView.deselectItem(along: transitionCoordinator)
    }
    
   func configure() {
        for section in sections {
//            section.delegate = self
            registerHeader(section)
        }
    }
    
    func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        view.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
      
    }
    
    fileprivate func registerCell(_ section: Sections, collectionView: UICollectionView, at indexPath: IndexPath) {
        let cellClass = section.cell(for: indexPath)
        collectionView.register(cellClass, forCellWithReuseIdentifier: cellClass.identifier)
        
        let nibName = UINib(nibName: cellClass.identifier, bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: cellClass.identifier)
    }
    
    fileprivate func registerFooter(section: Sections) {
        guard let footer = section.footer() else {
            return
        }
        let nibName = UINib(nibName: footer.identifier, bundle: nil)
        collectionView.register(nibName, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footer.identifier)
    }
    
    fileprivate func registerHeader(_ section: Sections) {
        guard let header = section.header() else {
            return
        }
        
        let nibHeader = UINib(nibName: header.identifier, bundle: nil)
        collectionView.register(nibHeader, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: header.identifier)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//         (presenter as? HomeBrandsList)?.scroll(contentOffset: collectionView.contentOffset)
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionHome = sections[section]
        
        if sectionHome.direction() == .vertical {
            return sectionHome.items.count
        } else {
            return 1
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = sections[indexPath.section]
        let identifier = section.cell(for: indexPath).identifier
        
        registerCell(section, collectionView: collectionView, at: indexPath)
        
        return collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let section = sections[indexPath.section]
        
        if kind == UICollectionView.elementKindSectionHeader, let sectionHeader = section.header() {
            
            return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: sectionHeader.identifier, for: indexPath)
        } else if let sectionFooter = section.footer() {
            return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: sectionFooter.identifier, for: indexPath)
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let section = sections[indexPath.section]
        
        registerCell(section, collectionView: collectionView, at: indexPath)
        
        let cellType = section.cell(for: indexPath)
        
        var sizeCell = section.getCellSize(cellType, for: indexPath)
        
        if sizeCell == .zero, let cell = section.cell(for: indexPath).fromNib() {
            cell.prepareForReuse()
            section.willDisplayCell(cell, at: indexPath)
            cell.cellWidthConstraint?.constant = section.cellWidth(collectionWidth: collectionView.frame.width)
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            sizeCell = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
            section.setCell(cellType, size: sizeCell, for: indexPath)
        }
        return sizeCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let section = sections[indexPath.section]
        if let cell = cell as? CollectionViewCell {
            section.willDisplayCell(cell, at: indexPath)
             cell.cellWidthConstraint?.constant = section.cellWidth(collectionWidth: collectionView.frame.width)
            section.requestAds(cell, at: indexPath)
            section.paginate(cell)
        }
        
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let section = sections[section]
        registerHeader(section)
        if let header = section.header()?.fromNib() {
            header.prepareForReuse()
            section.willDisplayHeader(header)
            header.setNeedsLayout()
            header.layoutIfNeeded()
            return CGSize(width: collectionView.bounds.width, height: 64)
        }
        return .zero
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        let section = sections[indexPath.section]
        view.setNeedsLayout()
        view.setNeedsDisplay()
        if elementKind == UICollectionView.elementKindSectionHeader, let header = view as? CollectionViewHeader {
            section.willDisplayHeader(header)
        } else if elementKind == UICollectionView.elementKindSectionFooter, let footer = view as? CollectionViewFooter {
            section.willDisplayFooter(footer)
        }
    }
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return sections[indexPath.section].shouldHighlight(at: indexPath)

//        if sections[indexPath.section].direction() == .vertical {
//            return true
//        } else {
//            return false
//        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sections[section].cellLineSpace(collectionWidth: collectionView.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if (sections.endIndex - 1) == section {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else {
            return sections[section].insetForSection()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let section = sections[indexPath.section]
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell else {
            return
        }
        
        section.didSelectCell(cell, at: indexPath)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.section <= sections.count {
            let section = sections[indexPath.section]
            
            if let cell = cell as? CollectionViewCell {
                section.didEndDisplayingCell(cell, at: indexPath)
            }
            
          
        }
    }
}
