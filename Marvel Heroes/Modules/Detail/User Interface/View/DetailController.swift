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
    
    let navigationBar = UIView(frame: .zero)
    
    let backButton = UIButton(image: UIImage(named: "back")!, tintColor: .white, target: self, action: #selector(didTap(_:)))
    
    
    var panGR: UIPanGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        self.hero.isEnabled = true
        self.view.hero.modifiers = [.cascade]
        view.backgroundColor = .black
        collectionView.backgroundColor = .black
        backgroundImageView.hero.id = idHero
        backgroundImageView.hero.isEnabled = true
        panGR = UIPanGestureRecognizer(target: self,
                                       action: #selector(handlePan(gestureRecognizer:)))
        view.addGestureRecognizer(panGR)
        
        navigationBar.backgroundColor = .black
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        backButton.backgroundColor = .clear
        backButton.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.addSubview(backButton)
        view.addSubview(navigationBar)
        NSLayoutConstraint.activate( [
            navigationBar.topAnchor.constraint(equalTo: view.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBar.heightAnchor.constraint(equalToConstant: 90),
            backButton.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor, constant: 24),
            backButton.topAnchor.constraint(equalTo: navigationBar.topAnchor, constant: 40),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 44)
            
            ]
        )
    }
    
    
    @objc func didTap(_ sender: Any?){
        presenter.didTap()
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
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let denominator: CGFloat = 50 //your offset treshold
        let alpha = min(1, scrollView.contentOffset.y / denominator)
        self.setNavbar(backgroundColorAlpha: alpha)
    }
    
    private func setNavbar(backgroundColorAlpha alpha: CGFloat) {
        let newColor = UIColor(red: 0, green: 0, blue: 0, alpha: alpha) //your color
        navigationBar.backgroundColor = newColor
        
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
