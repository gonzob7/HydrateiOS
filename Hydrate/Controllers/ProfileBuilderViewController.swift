//
//  ProfileBuilderViewController.swift
//  Hydrate
//
//  Created by Gonzalo Birrueta on 3/18/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import UIKit
import TransitionButton

class ProfileBuilderViewController: UIViewController, UIScrollViewDelegate{
    
    
    
    let scrollView: UIScrollView = {
        let scrollView: UIScrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize.height = 1.0
        return scrollView
    }()
    
    let container: UIStackView = {
        let container = UIStackView()
        container.axis = .vertical
        container.spacing = 0
        container.translatesAutoresizingMaskIntoConstraints = false
        container.distribution = .fillEqually
        return container
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupViews()
    }
    
    func setupViews(){
        
        scrollView.delegate = self
        

        view.addSubview(scrollView)
        scrollView.addSubview(container)

        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        container.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        container.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true


        
        let firstQuestion = GenderQuestion()
        let secondQuestion = WeightQuestion()
        let thirdQuestion = ActivityQuestion()
        let healthKitView = HealthKitPermissionsView()
        
        let questions = [healthKitView ,firstQuestion, secondQuestion, thirdQuestion]
        
        
        for question in questions{
            container.addArrangedSubview(question)
            question.heightAnchor.constraint(equalToConstant: view.frame.size.height).isActive = true
        }
        
        thirdQuestion.submitButton.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
        
        
    }
    
    
    @objc func submitTapped(_ sender: TransitionButton){
        sender.startAnimation() // 2: Then start the animation when the user tap the button
        let qualityOfServiceClass = DispatchQoS.QoSClass.background
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async(execute: {
            
            sleep(2) // 3: Do your networking task or background work here.
            
            DispatchQueue.main.async(execute: { () -> Void in
                // 4: Stop the animation, here you have three options for the `animationStyle` property:
                // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                // .shake: when you want to reflect to the user that the task did not complete successfly
                // .normal
                sender.stopAnimation(animationStyle: .normal, revertAfterDelay: 0.10, completion: {
                    let homeVC = HomeViewController()
                    self.navigationController?.pushViewController(homeVC, animated: true)
//                    self.present(homeVC, animated: true, completion: nil)
                })
            })
        })
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x > 0 || scrollView.contentOffset.x < 0 {
         scrollView.contentOffset.x = 0 //disable horizontal scrolling
        }
    }
}
