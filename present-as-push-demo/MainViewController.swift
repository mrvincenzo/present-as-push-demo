//
//  MainViewController.swift
//  present-as-push-demo
//
//  Created by mrvincenzo on 30/11/2017.
//  Copyright © 2017 XYZ. All rights reserved.
//

import UIKit

extension UIViewController {
    
    open func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, pushing: Bool, completion: (() -> Void)? = nil) {
        
        if pushing {
            
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromRight
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            view.window?.layer.add(transition, forKey: kCATransition)
            viewControllerToPresent.modalPresentationStyle = .fullScreen
            self.present(viewControllerToPresent, animated: false, completion: completion)
            
        } else {
            self.present(viewControllerToPresent, animated: flag, completion: completion)
        }
        
    }
    
}

class MainViewController: UIViewController {
    
    var presentedVC: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapPresent(_ sender: Any) {
        let presentedVC = self.storyboard!.instantiateViewController(withIdentifier: "PresentedViewController")
        presentedVC.view.backgroundColor = UIColor.green
        presentedVC.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(didTapCloseButton(_:)))
        let nvc = UINavigationController(rootViewController: presentedVC)
        present(nvc, animated: false, pushing: true, completion: nil)
    }
    
    @objc func didTapCloseButton(_ sender: Any) {
        if let presentedVC = presentedViewController {
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromLeft
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            presentedVC.view.window!.layer.add(transition, forKey: kCATransition)
        }
        
        dismiss(animated: false, completion: nil)
        
        presentedVC = nil
    }
}
