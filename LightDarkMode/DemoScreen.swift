//
//  ViewController.swift
//  LightDarkMode
//
//  Created by FIlip Stefański on 08/05/2023.
//

import UIKit

class DemoScreen: UIViewController {
    
    let modeSwitch = UISwitch()
    let iconView = UIImageView()
    let sunImage = UIImage(named: "Sun.png")
    let moonImage = UIImage(named: "Moon.png")
    let modeLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "Background")

        setUpView()
        setUpConstraint()
    }
    
    func setUpView() {
        view.addSubview(modeSwitch)
        modeSwitch.translatesAutoresizingMaskIntoConstraints = false
        if self.traitCollection.userInterfaceStyle == .dark {
            modeSwitch.isOn = true
        } else {
            modeSwitch.isOn = false
        }
        modeSwitch.addTarget(self, action: #selector(changeMode(_:)), for: .valueChanged)
        
        view.addSubview(modeLabel)
        modeLabel.textAlignment = .center
        modeLabel.text = "Light Mode"
        modeLabel.textColor = UIColor(named: "Text")
        modeLabel.numberOfLines = 0
        modeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(iconView)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.image = sunImage
    }
    
    func setUpConstraint() {
        NSLayoutConstraint.activate([
            iconView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            iconView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            iconView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            modeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            modeLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 20),
            
            modeSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            modeSwitch.bottomAnchor.constraint(equalTo: iconView.topAnchor, constant: -20)
        ])
    }
    
    @objc func changeMode(_ sender: UISwitch!) {
        if sender.isOn {
            overrideUserInterfaceStyle = .dark
            modeLabel.text = "Dark Mode"
            iconView.image = moonImage
        }
        else {
            overrideUserInterfaceStyle = .light
            modeLabel.text = "Light Mode"
            iconView.image = sunImage
        }
    }

}

