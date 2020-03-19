//
//  ProfileBuilderViewController.swift
//  Hydrate
//
//  Created by Gonzalo Birrueta on 3/18/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import UIKit

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
        
        let questions = [firstQuestion, secondQuestion, thirdQuestion]
        
        
        for question in questions{
            container.addArrangedSubview(question)
            question.heightAnchor.constraint(equalToConstant: view.frame.size.height).isActive = true
        }
        
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x > 0 || scrollView.contentOffset.x < 0 {
         scrollView.contentOffset.x = 0 //disable horizontal scrolling
        }
    }
}
