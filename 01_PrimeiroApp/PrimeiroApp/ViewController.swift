//
//  ViewController.swift
//  PrimeiroApp
//
//  Created by Marcelo Simoes on 09/08/14.
//  Copyright (c) 2014 Marcelo Simoes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var mensagemLabel: UILabel!
    
    @IBAction func exibirMensagem(sender: AnyObject) {
        
        mensagemLabel.text = "Olá, \(nomeTextField.text)!"
    }

}

