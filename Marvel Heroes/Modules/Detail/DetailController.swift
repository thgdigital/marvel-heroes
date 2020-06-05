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
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(didTap(_:)))

    }
    
    @objc func didTap(_ sender: Any?){
        Hero.shared.finish()
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
        self.navigationController?.navigationBar.backgroundColor = newColor
        UIApplication.shared.statusBarUIView?.backgroundColor = .red
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

extension UIApplication {
    
var statusBarUIView: UIView? {

    if #available(iOS 13.0, *) {
        let tag = 3848245

        let keyWindow = UIApplication.shared.connectedScenes
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows.first

        if let statusBar = keyWindow?.viewWithTag(tag) {
            return statusBar
        } else {
            let height = keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? .zero
            let statusBarView = UIView(frame: height)
            statusBarView.tag = tag
            statusBarView.layer.zPosition = 999999

            keyWindow?.addSubview(statusBarView)
            return statusBarView
        }

    } else {

        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
    }
    return nil
  }
}
