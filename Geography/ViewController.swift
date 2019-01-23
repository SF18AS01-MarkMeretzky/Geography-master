//
//  ViewController.swift
//  Geography
//
//  Created by Esteban Ordonez on 1/19/19.
//  Copyright © 2019 Esteban Ordonez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    var score: Int = 0;
    var selectedCountry: String = "";
    
    let countryName: [String] = [  //filenames + ".jpeg"
        "Austria",
        "Barbados",
        "Belgium",
        "Canada",
        "Chile",
        "China",
        "Denmark",
        "Ecuador",
        "Finland",
        "Germany",
        "Gibraltar",
        "Honduras",
        "Ireland",
        "Jamaica",
        "Kenya",
        "Liberia",
        "Morocco",
        "Nigeria",
        "Oman",
        "Pakistan",
        "Russia",
        "Somalia",
        "Switzerland",
        "Turkey",
        "Ukraine",
        "Uruguay",
        "Zambia"
    ];
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(countryName.count)
        //label.text = "Hit the flag button to start the game."
    }
    
    @IBAction func getFlag(_ sender: UIButton) {  //also to start new game
        score = 0;
        label.text = "You have one minute! Score: \(score)"
        perform(#selector(timer), with: self, afterDelay: 60);
        
        view.backgroundColor = .white;  //When the game is played again
        imageView.isHidden = false;
        textField.isHidden = false;
        
        if let flag: String = countryName.randomElement() {
            selectedCountry = flag;
            imageView.image = UIImage(named: flag);
            print(flag)
        }
    }
    
    @IBAction func uInput(_ sender: UITextField) {
        sender.resignFirstResponder()
        
        if let text: String = sender.text {
            if text == selectedCountry {
                score += 1;
                label.text = ("Good job! Total Score: \(score)")
            } else{
                score -= 1;
                label.text = "Oops! Wrong Answer... Try this one"
            }
            
            if let flag: String = countryName.randomElement() {
                selectedCountry = flag;
                imageView.image = UIImage(named: flag);
                print(flag)
            }
        }
        
        textField.text = nil;
        textField.placeholder = "Enter the flag's Country";
    }
    
    @objc func timer() {
        UIView.animate(
            withDuration: 2,
            delay: 0,
            options: [],
            animations: {
                self.view.backgroundColor = .black;
                self.label.text = "Time's up. Your final score is: \(self.score)";
                self.imageView.isHidden = true;
                self.textField.isHidden = true;
        },
            completion: nil
        );
    }
}

