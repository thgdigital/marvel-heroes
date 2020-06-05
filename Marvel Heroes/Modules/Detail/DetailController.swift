//
//  DetailController.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 03/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit
import Hero
import LBTATools


func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

class DetailController: CollectionViewController {
    var presenter: DetailPresenterInput!
    var idHero: String = ""
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "spider-man"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var panGR: UIPanGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        self.hero.isEnabled = true
        self.view.hero.modifiers = [.cascade]
        view.backgroundColor = .black
        collectionView.backgroundColor = .black
        
        panGR = UIPanGestureRecognizer(target: self,
                                       action: #selector(handlePan(gestureRecognizer:)))
        view.addGestureRecognizer(panGR)

    }
    
    @objc func handlePan(gestureRecognizer:UIPanGestureRecognizer) {
        let translation = panGR.translation(in: nil)
        let progress = translation.y / 2 / view.bounds.height
        switch panGR.state {
        case .began:
            guard translation.y > 0 else {
                return
            }
            dismiss(animated: true, completion: nil)
        case .changed:
            Hero.shared.update(progress)
            
        default:
            if progress + panGR.velocity(in: nil).y / view.bounds.height > 0.3 {
                Hero.shared.finish()
            } else {
                Hero.shared.cancel()
            }
        }
    }
    
}

extension DetailController: DetailPresenterOuput {
    
    func loadView(sections: [Sections]) {
        self.sections = sections
        collectionView.reloadData()
    }
    
    func showBackgroundView(idHero: String, image: String) {
        collectionView.backgroundView = backgroundImageView
        backgroundImageView.image = UIImage(named: image)
        backgroundImageView.hero.id = idHero
        let gradientView = GradientView(frame: collectionView.frame)
        collectionView.backgroundView?.addSubview(gradientView)
    }
}
