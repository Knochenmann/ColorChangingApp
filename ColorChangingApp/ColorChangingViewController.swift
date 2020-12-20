//
//  ColorChangingViewController.swift
//  ColorChangingApp
//
//  Created by Егор Костюхин on 18.12.2020.
//

import UIKit

protocol ColorChangingViewControllerDelegate: AnyObject {
    func changeColor(red: Float, green: Float, blue: Float)
}


class ColorChangingViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var colorView: UIView!
    
    var red: Float!
    var green: Float!
    var blue: Float!
    
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
    
    
    weak var delegate: ColorChangingViewControllerDelegate?
    
    override func viewWillLayoutSubviews() {
        colorView.layer.cornerRadius = 10
        
        redSliderView.tintColor = .red
        redSliderView.setValue(red, animated: true)
        
        redTextField.returnKeyType = .done
        redTextField.delegate = self
        redTextField.text = String(Int(red))
        redColorAmount.text = String(Int(red))
        
        greenSliderView.tintColor = .green
        greenSliderView.setValue(green, animated: true)
        
        greenTextField.returnKeyType = .done
        greenTextField.delegate = self
        greenTextField.text = String(Int(green))
        greenColorAmount.text = String(Int(green))
        
        blueSliderView.tintColor = .blue
        blueSliderView.setValue(blue, animated: true)
        
        blueTextField.returnKeyType = .done
        blueTextField.delegate = self
        blueTextField.text = String(Int(blue))
        blueColorAmount.text = String(Int(blue))
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        colorView.backgroundColor = UIColor(
            red: CGFloat(red)/255,
            green: CGFloat(green)/255,
            blue: CGFloat(blue)/255,
            alpha: 1
        )
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    private func changeColor(red: Float, green: Float, blue: Float) {
        colorView.layer.backgroundColor = CGColor(
            red: CGFloat(red)/255,
            green: CGFloat(green)/255,
            blue: CGFloat(blue)/255,
            alpha: 1
        )
    }

    
    private func showColorAmount(forColor color: Float,
                                 inView view: UILabel,
                                 inTextField textField: UITextField) {
        view.text = String(Int(color))
        textField.text = String(Int(color))
    }
    

    @IBAction func changeRedColorAmount(_ sender: Any) {
        red = redSliderView.value
        changeColor(red: red, green: green, blue: blue)
        showColorAmount(forColor: red, inView: redColorAmount, inTextField: redTextField)
    }
    
    
    @IBAction func changeGreenColorAmount(_ sender: Any) {
        green = greenSliderView.value
        changeColor(red: red, green: green, blue: blue)
        showColorAmount(forColor: green, inView: greenColorAmount, inTextField: greenTextField)
    }
    
    
    @IBAction func changeBlueColorAmount(_ sender: Any) {
        blue = blueSliderView.value
        changeColor(red: red, green: green, blue: blue)
        showColorAmount(forColor: blue, inView: blueColorAmount, inTextField: blueTextField)
    }
    
    
    @IBAction func colorizeAction(_ sender: Any) {
        delegate?.changeColor(red: red,
                              green: green,
                              blue: blue)
        
        navigationController?.popViewController(animated: true)
    }
}
