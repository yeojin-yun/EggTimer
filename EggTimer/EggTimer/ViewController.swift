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
    
    let softBtn = UIButton()
    let softLbl = UILabel()
    let mediumBtn = UIButton()
    let mediumLbl = UILabel()
    let hardBtn = UIButton()
    let hardLbl = UILabel()
    
    let progressBar = UIProgressView()
    
    let pointColor = UIColor(red: 81.0 / 255.0, green: 215.0 / 255.0, blue: 202.0 / 255.0, alpha: 1.0)
    let pointColor2 = UIColor(red: 95.0 / 255.0, green: 87.0 / 255.0, blue: 215.0 / 255.0, alpha: 1.0)
    
    var timer = Timer()
    var totalTime = 0
    var timePassed = 0
    var hardness = 0
    let timeToBoil = ["반숙":5, "반+완숙":8, "완숙":10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }


}

//MARK: -Event
extension ViewController {
    @objc func BtnTapped(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0.0
        mainLbl.text = "먹고 싶은 🥚 골라요"


        switch sender {
        case softBtn:
            guard let hardness = timeToBoil["반숙"] else { return }
            totalTime = hardness
            print(totalTime)
        case mediumBtn:
            guard let hardness = timeToBoil["반+완숙"] else { return }
            totalTime = hardness
        case hardBtn:
            guard let hardness = timeToBoil["완숙"] else { return }
            totalTime = hardness
        default:
            break
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        
    }
    
    @objc func updateTime() {
        
        if timePassed < totalTime {
            timePassed += 1
            let percentage = Float(timePassed) / Float(totalTime)
            progressBar.setProgress(percentage, animated: true)
            print(timePassed)
        } else {
            timer.invalidate()
            timePassed = 0
            mainLbl.text = "다 됐다!"
        }
        
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
        
        [softBtn, mediumBtn, hardBtn].forEach {
            $0.contentMode = .scaleAspectFit
        }
        
        [softLbl, mediumLbl, hardLbl].forEach {
            $0.textAlignment = .center
            $0.textColor = pointColor
            $0.font = UIFont.boldSystemFont(ofSize: 25)
        }
        progressBar.backgroundColor = .white
        progressBar.progress = 0.5
        progressBar.tintColor = pointColor2
    }
    
    final private func addTarget() {
        softBtn.addTarget(self, action: #selector(BtnTapped(_:)), for: .touchUpInside)
        mediumBtn.addTarget(self, action: #selector(BtnTapped(_:)), for: .touchUpInside)
        hardBtn.addTarget(self, action: #selector(BtnTapped(_:)), for: .touchUpInside)
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


        [background, mainLbl, stackView, progressBar].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            progressBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200),
            progressBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            progressBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            //progressBar.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            background.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            
            mediumLbl.heightAnchor.constraint(equalTo: softLbl.heightAnchor),
            hardLbl.heightAnchor.constraint(equalTo: softLbl.heightAnchor),

            
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 240),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -300),
            
            
            mainLbl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            mainLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            
            
        ])
    }
}

