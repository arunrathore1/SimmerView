//
//  ViewController.swift
//  SimmerView
//
//  Created by Arun Rathore on 31/01/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIView!
    @IBOutlet weak var nameContainerView: UIView!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        profileImageView.startAnimating()
//        nameContainerView.startAnimating()
//        emailContainerView.startAnimating()
        
        
        self.emailContainerView.showShimmer()
        
//
        self.imageView.layer.masksToBounds = true
        self.imageView.backgroundColor = .brown
        self.imageView.layer.cornerRadius = 40
//
  
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.imageView.showShimmer()
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            self.imageView.hideShimmer()
        }

        
        
    }


}
