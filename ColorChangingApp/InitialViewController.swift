//
//  ViewController.swift
//  ColorChangingApp
//
//  Created by Егор Костюхин on 18.12.2020.
//

import UIKit

class InitialViewController: UIViewController {
    
    @IBOutlet var pictureView: UIImageView!
    
    var red: Float!
    var green: Float!
    var blue: Float!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        red = 71
        green = 63
        blue = 65
    }
    override func viewWillLayoutSubviews() {
        pictureView.backgroundColor = UIColor(red: CGFloat(red) / 255,
                                              green: CGFloat(green) / 255,
                                              blue: CGFloat(blue) / 255,
                                              alpha: 1
        )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorChangingVC = segue.destination as! ColorChangingViewController
        colorChangingVC.delegate = self
        colorChangingVC.red = red
        colorChangingVC.green = green
        colorChangingVC.blue = blue
    }
    

}

extension InitialViewController: ColorChangingViewControllerDelegate {
    func changeColor(red: Float, green: Float, blue: Float) {
        pictureView.backgroundColor = UIColor(
            red: CGFloat(red)/255,
            green: CGFloat(green)/255,
            blue: CGFloat(blue)/255,
            alpha: 1
        )
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    
    
}

