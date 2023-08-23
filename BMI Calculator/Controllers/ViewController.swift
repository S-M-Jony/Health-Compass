//
//  ViewController.swift
//  BMI Calculator
//


import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightSliderOutlet: UISlider!
    @IBOutlet weak var heightSliderOutlet: UISlider!
   // var bmivalue = "0.0"
    var calculatorBrain = CalculatorBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSlider(_ sender: UISlider) {
        let height =  String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)Kg"
    }
    

    @IBAction func calculate(_ sender: UIButton) {
        let height = heightSliderOutlet.value
        let weight = weightSliderOutlet.value
        calculatorBrain.calculateBMI(height: height, weight: weight)
       // let bmi = weight / (height * height)
       // bmivalue = String(format: "%.1f",bmi)
     //   let secondViewController = ResultViewController()
     //   self.present(secondViewController, animated: true, completion: nil)
        self.performSegue(withIdentifier: "performSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultViewController
        //destinationVC.bmiValue = bmivalue
        destinationVC.bmiValue = calculatorBrain.getBMIValue()
        destinationVC.advice = calculatorBrain.getAdvice()
        destinationVC.color = calculatorBrain.getColor()
    }
    
    
    
}

