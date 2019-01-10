//
//  ViewController.swift
//  tip calculator
//
//  Created by chris on 1/9/19.
//  Copyright © 2019 YSYP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var originalAmount = Int()
    var constraints = [NSLayoutConstraint]()

    @IBOutlet weak var slider: UISlider!{
        didSet{
            slider.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
        }
    }
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var tipPercentage: UILabel!
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBAction func tipPercentage(_ sender: Any) {
        tipPercentage.text = "\((Int)(slider.value * 100) / 4)%"
        tipPercentage.textColor = UIColor(red:0.96, green:0.64, blue:0.04, alpha:1.0)
        if(amount.hasText){
            let result = (((slider.value * 100).rounded(.towardZero) / 4.0 + 100) / 100) * Float(amount.text!)!
            resultLabel.text = "$" + String(format:"%.02f", result)
            resultLabel.textColor = UIColor(red:0.96, green:0.64, blue:0.04, alpha:1.0)
        }else{
            resultLabel.text = "$0.00"
            resultLabel.textColor = UIColor(red:0.96, green:0.64, blue:0.04, alpha:1.0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.center = CGPoint(x: self.view.frame.size.width / 1.17, y: self.view.frame.size.height/2.8)
        
        amount.keyboardType = UIKeyboardType.decimalPad
        amount.becomeFirstResponder()
        amount.textColor = UIColor(red:0.96, green:0.64, blue:0.04, alpha:1.0)
        amount.placeholder = "Enter amount"
        amount.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

        tipPercentage.text = "\((Int)(slider.value * 100) / 4)%"
        tipPercentage.textColor = UIColor(red:0.96, green:0.64, blue:0.04, alpha:1.0)
        
        tipLabel.textColor = UIColor(red:0.96, green:0.64, blue:0.04, alpha:1.0)
        
        resultLabel.text = "$0.00"
        resultLabel.textColor = UIColor(red:0.96, green:0.64, blue:0.04, alpha:1.0)
    
        self.view.backgroundColor = UIColor(red:0.96, green:0.64, blue:0.04, alpha:1.0)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if(amount.hasText){
            let result = (((slider.value * 100).rounded(.towardZero) / 4.0 + 100) / 100) * Float(amount.text!)!
            resultLabel.text = "$" + String(format:"%.02f", result)
            resultLabel.textColor = UIColor(red:0.96, green:0.64, blue:0.04, alpha:1.0)
        }else{
            resultLabel.text = "$0.00"
            resultLabel.textColor = UIColor(red:0.96, green:0.64, blue:0.04, alpha:1.0)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

