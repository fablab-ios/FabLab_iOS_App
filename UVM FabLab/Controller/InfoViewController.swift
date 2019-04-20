//
//  InfoViewController.swift
//  UVM FabLab
//
//  Created by Abby Linstone on 2/14/19.
//  Copyright © 2019 UVM. All rights reserved.
//

import UIKit
import SnapKit

private let scrollView = UIScrollView()
private let infoText = UILabel()
private let imageView = UIImageView()
private let label1 = UILabel()
private let label2 = UITextView()
private let mainTxtLabel1 = UILabel()
private let mainTxtLabel2 = UILabel()

class InfoViewController: UIViewController {
    
    let fabWebAPI = FabWebAPI()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .gray
        
        scrollView.contentInsetAdjustmentBehavior = .never
        
        imageView.image = UIImage(named: "Header2")
        imageView.backgroundColor = UIColor.clear
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        label1.frame = CGRect(x:0, y:0, width:0.2 , height: 0.4)
        label1.text = "UVM FABLAB"
        label1.textAlignment = .center
        label1.textColor = #colorLiteral(red: 0, green: 0.4431372549, blue: 0.3333333333, alpha: 1)
        label1.font = UIFont(name: "GoboldBold", size: CGFloat(30))
        label1.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        label1.clipsToBounds = true
        
        label2.frame = CGRect(x:0, y:0, width:imageView.frame.width , height:imageView.frame.height)
        label2.text = "\n An incubator for ideas and a place to engage people’s imaginations, the UVM FabLab makes rapid-prototyping tools available to UVM students and faculty."
        label2.textAlignment = .center
        label2.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label2.font = UIFont(name: "Raleway-Regular", size: CGFloat(12))
        label2.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        label2.clipsToBounds = true
        
        infoText.textColor = .black
        infoText.font = UIFont(name: "Raleway-Regular", size: CGFloat(14))
        infoText.numberOfLines = 0
        
        fabWebAPI.getInfo { (info) in
            infoText.text = info
        }
        
//        let labelContainer = UIView()
//        labelContainer.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
//        mainTxtLabel1.frame = CGRect(x:0, y:0, width:0.2 , height: 0.4)
//        mainTxtLabel1.text = "FAQs"
//
//        let labelContainer2 = UIView()
//        labelContainer2.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
//        mainTxtLabel2.frame = CGRect(x:0, y:0, width:0.2 , height: 0.4)
//        mainTxtLabel2.text = "General Information"
        
        let textContainer = UIView()
        textContainer.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(imageView)
        scrollView.addSubview(textContainer)
        
        imageView.addSubview(label1)
        imageView.addSubview(label2)
        textContainer.addSubview(infoText)

        infoText.addSubview(mainTxtLabel1)
        infoText.addSubview(mainTxtLabel2)
        
        scrollView.snp.makeConstraints {
            make in
            
            make.edges.equalTo(view)
        }
        
        
        imageView.snp.makeConstraints {
            make in
            
            make.top.equalTo(scrollView)
            make.left.right.equalTo(view)
            make.height.equalTo(imageView.snp.width).multipliedBy(0.7)
        }
        label1.snp.makeConstraints {
            make in
            
            make.width.equalTo(200)
            make.height.equalTo(60)
            make.centerX.equalTo(95)
            make.centerY.equalTo(120)
        }
        label2.snp.makeConstraints {
            make in
            
            make.width.equalTo(250)
            make.height.equalTo(90)
            make.centerX.equalTo(150)
            make.centerY.equalTo(180)
        }
        textContainer.snp.makeConstraints {
            make in
        make.top.equalTo(imageView.snp.bottom)
            make.left.right.equalTo(view)
            make.bottom.equalTo(scrollView)
        }
        infoText.snp.makeConstraints {
            make in
            
            make.edges.equalTo(textContainer).inset(14)
        }
    }
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


