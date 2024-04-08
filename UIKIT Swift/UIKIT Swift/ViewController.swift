//
//  ViewController.swift
//  UIKIT Swift
//
//  Created by Usuário Convidado on 08/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblIdade: UILabel!
    @IBOutlet weak var lblPas: UILabel!
    @IBOutlet weak var lblPad: UILabel!
    @IBOutlet weak var lblSMS: UILabel!
    @IBOutlet weak var clasRisco: UISegmentedControl!
    @IBOutlet weak var meuStepper: UIStepper!
    @IBOutlet weak var receberLink: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        lblIdade.text = "\(Int(sender.value))"
    }
    
    @IBAction func sliderPasValueChanged(_ sender: UISlider) {
        lblPas.text = "\(Int(sender.value))"
    }
    
    @IBAction func sliderPadValueChanged(_ sender: UISlider) {
        lblPad.text = "\(Int(sender.value))"
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        print(sender.isOn)
        
        if(sender.isOn){
            lblSMS.alpha = 1
            receberLink.alpha = 1
        }else{
            lblSMS.alpha = 0
            receberLink.alpha = 0
        }
    }
    
    @IBAction func receberLink(_ sender: Any) {
        let alerta = UIAlertController(
            title: "Forma para receber o exame", message: "Faça sua escolha", preferredStyle: UIAlertController.Style.actionSheet
        )
        
        alerta.addAction(UIAlertAction(title: "SMS", style: UIAlertAction.Style.default, handler: { (action) in
            self.lblSMS.text = action.title
        }))
        
        alerta.addAction(UIAlertAction(title: "E-mail", style: UIAlertAction.Style.default, handler: { (action) in
            self.lblSMS.text = action.title
        }))
        
        alerta.addAction(UIAlertAction(title: "Cancelar", style: UIAlertAction.Style.cancel, handler: nil
        ))

        present(alerta, animated: true, completion: nil)
    }
    
    @IBAction func salvar(_ sender: Any) {
        var tipo: String
        var msg: String
        
        if clasRisco.selectedSegmentIndex >= 0 {
            tipo = clasRisco.titleForSegment(at: clasRisco.selectedSegmentIndex)!
            
            msg = "Triagem \(tipo), paciente com idade de \(lblIdade.text!) anos salvo com sucesso"
        }else{
            tipo = ""
            msg = "Antes de salvar escolha a classificação de risco"
        }
        
        let alerta = UIAlertController(
            title: "Atenção", message: msg, preferredStyle: UIAlertController.Style.alert
        )
        
        alerta.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil
        ))
        
        present(alerta, animated: true, completion: nil)
    }
    
    
    @IBAction func indexChanged(_ sender: Any) {
        switch clasRisco.selectedSegmentIndex {
            case 0:
                print("Você escolheu o primeiro botão")
            case 1:
                print("Você escolheu o segundo botão")
            case 2:
                print("Você escolheu o terceiro botão")
            case 3:
            print("Você escolheu o \(clasRisco.titleForSegment(at: clasRisco.selectedSegmentIndex)!) botão")
            default:
                break
        }
    }
    
}

