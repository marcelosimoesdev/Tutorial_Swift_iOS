//
//  ViewController.swift
//  SliderRGB
//
//  Created by Marcelo Simoes on 11/08/14.
//  Copyright (c) 2014 Marcelo Simoes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var viewRGB: UIView!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        ajustarCorView()
    }

    @IBAction func ajustarCorView() {
        
        let red = CGFloat(redSlider.value) / 255.0
        let green = CGFloat(greenSlider.value) / 255.0
        let blue = CGFloat(blueSlider.value) / 255.0
        let alpha = CGFloat(alphaSlider.value) / 255.0
        
        redLabel.text = "Red: \(Int(redSlider.value))"
        greenLabel.text = "Green: \(Int(greenSlider.value))"
        blueLabel.text = "Blue: \(Int(blueSlider.value))"
        alphaLabel.text = "Alpha: \(Int(alphaSlider.value))"
        
        let cor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        viewRGB.backgroundColor = cor
    }

}

