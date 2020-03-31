//
//  ViewController.swift
//  Calculadora
//
//  Created by Marcelo Simoes on 3/30/20.
//  Copyright © 2020 Marcelo Simoes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Operacoes: String {
        case Percentual = "%"
        case Divisao = "÷"
        case Multiplicacao = "×"
        case Subtracao = "-"
        case Adicao = "+"
        case Igual = "="
        case Nenhuma = ""
    }

    @IBOutlet weak var displayTextField: UILabel!
    @IBOutlet weak var igualButton: UIButton!
    
    var valorAnterior = 0.0
    var operacaoAnterior = Operacoes.Nenhuma
    var reiniciarDisplay = false
    var executandoOperacao = false
    
    var valorDisplay: String = "0" {
        didSet {
            if executandoOperacao && valorDisplay.contains(".") { // Ao totalizar, remove o .0 caso não possua casas decimais.
                let valor = Double(valorDisplay)!
                
                if valor.truncatingRemainder(dividingBy: 1) == 0 {
                    valorDisplay.removeLast(2)
                }
            }
            
            displayTextField.text = valorDisplay
        }
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()

        definirObjetoRedondo(igualButton)
    }

    func definirObjetoRedondo(_ objeto: AnyObject) {
        
        objeto.layer?.cornerRadius = objeto.frame.size.width / 2
        objeto.layer?.masksToBounds = true
    }
    
    @IBAction func limparClick() {
        
        valorAnterior = 0.0
        operacaoAnterior = .Nenhuma
        reiniciarDisplay = false
        executandoOperacao = false
        valorDisplay = "0"
    }
    
    @IBAction func backspaceClick() {
        
        if valorDisplay.count > 1 {
            valorDisplay.removeLast()
        }
        else {
            valorDisplay = "0"
        }
    }
    
    @IBAction func numeroClick(_ sender: UIButton) {
        
        if let numero = sender.titleLabel!.text {
            
            if valorDisplay == "0" || reiniciarDisplay {
                valorDisplay = numero == "." ? "0." : numero
                reiniciarDisplay = false
            }
            else {
                valorDisplay = valorDisplay + numero
            }
        }
    }
    
    @IBAction func operacaoClick(_ sender: UIButton) {
        
        if let operacao = Operacoes(rawValue: sender.titleLabel!.text!) {
            
            if operacao == .Percentual {
                calcularPercentual()
            }
            else if operacao == .Igual {
                totalizar()
            }
            else {
                if operacaoAnterior != .Nenhuma {
                    totalizar()
                }
                
                valorAnterior = Double(valorDisplay)!
                operacaoAnterior = operacao
                reiniciarDisplay = true
            }
        }
    }
    
    func calcularPercentual() {
        
        executandoOperacao = true
        defer { executandoOperacao = false }
        
        if valorAnterior != 0 && (operacaoAnterior == .Adicao || operacaoAnterior == .Subtracao) {
            valorDisplay = String(valorAnterior * (Double(valorDisplay)! / 100))
        }
        else {
            valorDisplay = String(Double(valorDisplay)! / 100)
        }
    }
    
    func totalizar() {
        
        executandoOperacao = true
        defer { executandoOperacao = false }
        
        let valorAtual = Double(valorDisplay)!
        var valorTotal = 0.0
        
        if operacaoAnterior == .Divisao {
            valorTotal = valorAnterior / valorAtual
        }
        else if operacaoAnterior == .Multiplicacao {
            valorTotal = valorAnterior * valorAtual
        }
        else if operacaoAnterior == .Subtracao {
            valorTotal = valorAnterior - valorAtual
        }
        else if operacaoAnterior == .Adicao {
            valorTotal = valorAnterior + valorAtual
        }
        
        valorDisplay = String(valorTotal)
        operacaoAnterior = .Nenhuma
        
        reiniciarDisplay = true
    }
}

