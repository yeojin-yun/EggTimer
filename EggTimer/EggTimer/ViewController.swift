//
//  ViewController.swift
//  EggTimer
//
//  Created by 순진이 on 2022/02/03.
//

import UIKit

class ViewController: UIViewController {

    let mainLbl = UILabel()
    let background = UIImageView()
    
    let softLbl = UILabel()
    let softBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    let mediumBtn = UIButton()
    let mediumLbl = UILabel()
    let hardBtn = UIButton()
    let hardLbl = UILabel()
    
    let pointColor = UIColor(red: 81.0 / 255.0, green: 215.0 / 255.0, blue: 202.0 / 255.0, alpha: 1.0)
    let pointColor2 = UIColor(red: 95.0 / 255.0, green: 87.0 / 255.0, blue: 215.0 / 255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }


}

//MARK: -UI
extension ViewController {
    final private func configureUI() {
        setAttributes()
        addTarget()
        setConstraints()
    }
    
    final private func setAttributes() {
        mainLbl.text = "먹고 싶은 🥚 골라요"
        mainLbl.textAlignment = .center
        mainLbl.font = UIFont.boldSystemFont(ofSize: 40)
        mainLbl.textColor = pointColor2
        
        background.image = UIImage(named: "cool-background")
        
        softBtn.setImage(UIImage(named: "soft_egg"), for: .normal)
        softLbl.text = "반숙"
        
        mediumBtn.setImage(UIImage(named: "medium_egg"), for: .normal)
        mediumLbl.text = "반+완숙"
        
        hardBtn.setImage(UIImage(named: "hard_egg"), for: .normal)
        hardLbl.text = "완숙"
        
//        [softBtn, mediumBtn, hardBtn].forEach {
//            $0.contentMode = .scaleToFill
//        }
        
        [softLbl, mediumLbl, hardLbl].forEach {
            $0.textAlignment = .center
            $0.textColor = pointColor
            $0.font = UIFont.boldSystemFont(ofSize: 30)
        }
    }
    
    final private func addTarget() {
        
    }
    
    final private func setConstraints() {
        let softStack = UIStackView(arrangedSubviews: [softLbl,softBtn])
        softStack.axis = .vertical
        softStack.spacing = 10
        
        let mediumStack = UIStackView(arrangedSubviews: [mediumLbl,mediumBtn])
        mediumStack.axis = .vertical
        mediumStack.spacing = 10
        
        let hardStack = UIStackView(arrangedSubviews: [hardLbl,hardBtn])
        hardStack.axis = .vertical
        hardStack.spacing = 10
        
        let stackView = UIStackView(arrangedSubviews: [softStack, mediumStack, hardStack])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20


        [background, mainLbl, stackView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),


            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            //stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            
            softBtn.widthAnchor.constraint(equalToConstant: 180),
            softStack.heightAnchor.constraint(equalToConstant: 180),
            
            mainLbl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            //mainLbl.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            mainLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            
        ])
    }
}

