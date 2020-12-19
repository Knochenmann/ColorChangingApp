//
//  ViewController.swift
//  ColorChangingApp
//
//  Created by Егор Костюхин on 18.12.2020.
//

import UIKit

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorChangingVC = segue.destination as! ColorChangingViewController
        colorChangingVC.delegate = self
    }

}

extension InitialViewController: ColorChangingViewControllerDelegate {
    func changeColor() {
        view.backgroundColor = UIColor(red: 100/255, green: 3/255, blue: 100/255, alpha: 1)
    }
    
    
}
