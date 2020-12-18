//
//  ColorChangingViewController.swift
//  ColorChangingApp
//
//  Created by Егор Костюхин on 18.12.2020.
//

import UIKit

class ColorChangingViewController: UIViewController {
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redColorAmount: UILabel!
    @IBOutlet var greenColorAmount: UILabel!
    @IBOutlet var blueColorAmount: UILabel!
    
    
    @IBOutlet var redSliderView: UISlider!
    @IBOutlet var greenSliderView: UISlider!
    @IBOutlet var blueSliderView: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    @IBOutlet var actionButton: UIButton!
    
    override func viewWillLayoutSubviews() {
        colorView.layer.cornerRadius = 10
        
        redSliderView.tintColor = .red
        greenSliderView.tintColor = .green
        blueSliderView.tintColor = .blue
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    private func changeColor() {
        colorView.layer.backgroundColor = CGColor(
            red: CGFloat(redSliderView.value)/255,
            green: CGFloat(greenSliderView.value)/255,
            blue: CGFloat(blueSliderView.value)/255,
            alpha: 1
        )
    }
//    private func changeColorManually () {
//        colorView.layer.backgroundColor = CGColor(
//            red: CGFloat(redTextField.text)/255,
//            green: CGFloat(greenTextField.text)/255,
//            blue: CGFloat(blueTextField.text)/255,
//            alpha: 1
//    }
    
    private func showColorAmount(in view: UILabel, from slider: UISlider) {
        view.text = "\(Int(slider.value))"
    }

    @IBAction func changeRedColorAmount(_ sender: Any) {
        changeColor()
        showColorAmount(in: redColorAmount, from: redSliderView)
    }
    
    
    @IBAction func changeGreenColorAmount(_ sender: Any) {
        changeColor()
        showColorAmount(in: greenColorAmount, from: greenSliderView)
    }
    
    
    @IBAction func changeBlueColorAmount(_ sender: Any) {
        changeColor()
        showColorAmount(in: blueColorAmount, from: blueSliderView)
    }
}
