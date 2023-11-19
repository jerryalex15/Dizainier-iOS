//
//  ViewController.swift
//  Diz_UIkit
//
//  Created by Andriamaherison Fifa on 19/11/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lResult: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var step: UIStepper!
    @IBOutlet weak var diz: UISegmentedControl!
    @IBOutlet weak var unit: UISegmentedControl!
    @IBOutlet weak var mySwitch: UISwitch!
    var valueNumber: Int = 50;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.value = Float(valueNumber)
        step.value = Double(valueNumber)
        
        step.maximumValue = 99
        
        slider.minimumValue = 0
        slider.maximumValue = 99
        setLabelAndValue(value: valueNumber)
        
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        step.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
    
        diz.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        
        unit.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        mySwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
            }

        @objc func switchValueChanged(_ sender: UISwitch) {
            // La propriété isOn du switch indique si le switch est activé ou désactivé
            let isSwitchOn = sender.isOn
            setLabelAndValue(value: valueNumber)
            // Faites quelque chose avec l'état du switch, par exemple, imprimez-le
            print("Le switch a changé d'état. Est-il activé ? \(isSwitchOn)")
        }

     @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
         // L'index de la valeur sélectionnée dans le segmented control est accessible via la propriété selectedSegmentIndex
         let selectedIndex = sender.selectedSegmentIndex
         var dizaine: Int = 0
         var unite: Int = 0
         if sender == diz {
             dizaine = Int(selectedIndex) * 10
             // Faites quelque chose avec l'index sélectionné, par exemple, imprimez-le
             setLabelAndValue(value: dizaine + unit.selectedSegmentIndex)
             print("Index sélectionné dans dizaine: \(selectedIndex)")
         } else if sender == unit {
             unite = Int(selectedIndex)
             setLabelAndValue(value: (diz.selectedSegmentIndex * 10) + unite)
             print("Index sélectionné dans unité: \(selectedIndex)")
         }
     }

    @objc func stepperValueChanged(_ sender: UIStepper) {
        // La valeur actuelle du stepper est accessible via la propriété value
        let stepperValue = sender.value
        
        // Faites quelque chose avec la valeur du stepper, par exemple, imprimez-la
        setLabelAndValue(value: Int(stepperValue))
//        print("La valeur du stepper est : \(stepperValue)")
    }

    @objc func sliderValueChanged(_ sender: UISlider) {
        // La valeur actuelle du slider est accessible via la propriété value
        let sliderValue = sender.value
        
        setLabelAndValue(value: Int(sliderValue))
//        print("La valeur du slider est : \(sliderValue)")
    }
    
    func setLabelAndValue(value: Int){
        valueNumber = value
        
        slider.value = Float(value)
        step.value = Double(value)
        diz.selectedSegmentIndex = value / 10
        unit.selectedSegmentIndex = value % 10
        
        if mySwitch.isOn {
            let valueHex = String(format: "%X", value)
            lResult.text = valueHex
        } else {
            lResult.text = String(value)
    //        lResult.text = "\(value)"
        }
    }

    @IBAction func reset(_ sender: Any) {
        setLabelAndValue(value: 0)
    }
    @IBAction func changeValueSwitch(_ sender: Any) {
    }
    
}

