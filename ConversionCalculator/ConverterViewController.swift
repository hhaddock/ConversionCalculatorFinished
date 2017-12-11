//
//  ConverterViewController.swift
//  ConversionCalculator
//
//  Created by Hayden Haddock on 11/11/17.
//  Copyright © 2017 Tech Innovator. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    var numString: String = ""
    var inputNum: Double = 0.0
    var outputNum: Double = 0.0
    
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    var conversions: [Converter] = []
    var currentConverter:Converter = Converter(label:"", inputUnit:"", outputUnit:"")
    
    @IBAction func test(_ sender: Any) {
    }
    @IBOutlet weak var buttonPresed: UIButton!
    @IBAction func buttonPressed(_ sender: Any) {
    }
    @IBAction func convertPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Choose Converter", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: conversions[0].label, style:UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.setCurrentConverter(converter: self.conversions[0])
        }))
        alert.addAction(UIAlertAction(title: conversions[1].label, style:UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.setCurrentConverter(converter: self.conversions[1])
        }))
        alert.addAction(UIAlertAction(title: conversions[2].label, style:UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.setCurrentConverter(converter: self.conversions[2])
        }))
        alert.addAction(UIAlertAction(title: conversions[3].label, style:UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.setCurrentConverter(converter: self.conversions[3])
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            numString += String(0)
            inputDisplay.text = numString + currentConverter.inputUnit
            inputNum = Double(numString)!;
            convertNum(inputNum: inputNum, converter: currentConverter)
        case 2:
            numString += "."
            inputDisplay.text = numString + currentConverter.inputUnit
            inputNum = Double(numString)!;
            convertNum(inputNum: inputNum, converter: currentConverter)
        case 3:
            numString += String(1)
            inputDisplay.text = numString + currentConverter.inputUnit
            inputNum = Double(numString)!;
            convertNum(inputNum: inputNum, converter: currentConverter)
        case 4:
            numString += String(2)
            inputDisplay.text = numString + currentConverter.inputUnit
            inputNum = Double(numString)!;
            convertNum(inputNum: inputNum, converter: currentConverter)
        case 5:
            numString += String(3)
            inputDisplay.text = numString + currentConverter.inputUnit
            inputNum = Double(numString)!;
            convertNum(inputNum: inputNum, converter: currentConverter)
        case 6:
            numString += String(4)
            inputDisplay.text = numString + currentConverter.inputUnit
            inputNum = Double(numString)!;
            convertNum(inputNum: inputNum, converter: currentConverter)
        case 7:
            numString += String(5)
            inputDisplay.text = numString + currentConverter.inputUnit
            inputNum = Double(numString)!;
            convertNum(inputNum: inputNum, converter: currentConverter)
        case 8:
            numString += String(6)
            inputDisplay.text = numString + currentConverter.inputUnit
            inputNum = Double(numString)!;
            convertNum(inputNum: inputNum, converter: currentConverter)
        case 9:
            numString += String(7)
            inputDisplay.text = numString + currentConverter.inputUnit
            inputNum = Double(numString)!;
            convertNum(inputNum: inputNum, converter: currentConverter)
        case 10:
            numString += String(8)
            inputDisplay.text = numString + currentConverter.inputUnit
            inputNum = Double(numString)!;
            convertNum(inputNum: inputNum, converter: currentConverter)
        case 11:
            numString += String(9)
            inputDisplay.text = numString + currentConverter.inputUnit
            inputNum = Double(numString)!;
            convertNum(inputNum: inputNum, converter: currentConverter)
        default: break
        }
        print(inputNum);
    }
    
    func setCurrentConverter(converter:Converter) {
        currentConverter = converter
        
        inputDisplay.text = currentConverter.inputUnit
        outputDisplay.text = currentConverter.outputUnit
        
        print(currentConverter)
    }
    
    @IBAction func clearInput(_ sender: Any) {
        inputDisplay.text = currentConverter.inputUnit
        outputDisplay.text = currentConverter.outputUnit
        
        inputNum = 0.0
        outputNum = 0.0
        numString = ""
    }
    func convertNum(inputNum: Double, converter: Converter) {
        switch converter.inputUnit {
        case "°F":
            print("CONVERTING F to C")
            outputNum = convertFToC(num: inputNum)
            outputDisplay.text = String(outputNum) + converter.outputUnit
        case "°C":
            print("CONVERTING C to F")
            outputNum = convertCToF(num: inputNum)
            outputDisplay.text = String(outputNum) + converter.outputUnit
        case "km":
            print("CONVERTING km to mi")
            outputNum = convertKmToMi(num: inputNum)
            outputDisplay.text = String(outputNum) + converter.outputUnit
        case "mi":
            print("CONVERTING mi to km")
            outputNum = convertMiToKm(num: inputNum)
            outputDisplay.text = String(outputNum) + converter.outputUnit
        default:
            break
        }
    }
    
    @IBAction func negPosConversion(_ sender: Any) {
        if(inputNum > 0) {
            let tempNum = inputNum * -1
            inputDisplay.text = String(tempNum) + currentConverter.inputUnit
            convertNum(inputNum: tempNum, converter: currentConverter)
        }
        else if(inputNum < 0) {
            inputDisplay.text = String(inputNum) + currentConverter.inputUnit
            convertNum(inputNum: inputNum, converter: currentConverter)
        }

    }
    
    func convertFToC(num: Double) -> Double {
        let celcius = round((num - 32) * (5/9))
        return celcius
    }
    
    func convertCToF(num: Double) -> Double {
        let fahrenheight = round((num * (9/5) + 32))
        return fahrenheight
    }
    
    func convertKmToMi(num: Double) -> Double {
        let miles = num/1.609344
        return miles;
    }
    
    func convertMiToKm(num: Double) -> Double {
        let km = (num * 1.609344)
        return km
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conversions = [Converter(label:"farenheit to celcius", inputUnit:"°F", outputUnit:"°C"),
                           Converter(label:"celcius to farenheit", inputUnit:"°C", outputUnit:"°F"),
                           Converter(label:"miles to kilometers", inputUnit:"mi", outputUnit:"km"),
                           Converter(label:"kilometers to miles", inputUnit:"km", outputUnit:"mi")]
        
        setCurrentConverter(converter: conversions[0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
