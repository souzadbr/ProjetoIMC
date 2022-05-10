//
//  ViewController.swift
//  IMC
//
//  Created by Debora.souza on 09/05/22.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tfWeigth: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var ivResult: UIImageView!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var viResult: UIView!
    var imc: Double = 0
    //MARK: - ciclo de vida da view
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //MARK: - Actions
    @IBAction func calculate(_ sender: Any) {
        if let weight = Double (tfWeigth.text!), let height = Double(tfHeight.text!){
            imc = weight / (height*height)  //ou pow(height,2)
            
            showResults()
        }
    }
    func showResults(){
        var result: String = ""
        var image: String = ""
        switch imc{
            case 0..<16:
                result = "Magreza"
                image = "abaixo"
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
        
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        lbResult.text = result
        ivResult.image = UIImage (named: image)
        viResult.isHidden = false
    }
}

