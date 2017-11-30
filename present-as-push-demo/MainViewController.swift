//
//  MainViewController.swift
//  present-as-push-demo
//
//  Created by mrvincenzo on 30/11/2017.
//  Copyright © 2017 XYZ. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var presentedVC: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapPresent(_ sender: Any) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)

        let presentedVC = self.storyboard!.instantiateViewController(withIdentifier: "PresentedViewController")
        presentedVC.view.backgroundColor = UIColor.green
        presentedVC.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(didTapCloseButton(_:)))
        let nvc = UINavigationController(rootViewController: presentedVC)
        present(nvc, animated: false, completion: nil)
    }
    
    @objc func didTapCloseButton(_ sender: Any) {
        if let presentedVC = presentedViewController {
            let transition = CATransition()
            transition.duration = 0.3
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromLeft
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            presentedVC.view.window!.layer.add(transition, forKey: kCATransition)
        }
        
        dismiss(animated: false, completion: nil)
        
        presentedVC = nil
    }
}
