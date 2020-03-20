//
//  PieChartViewControllelr.swift
//  Hydrate
//
//  Created by Gonzalo Birrueta on 3/20/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import Foundation
import UIKit
import Charts

class PieChartViewController: DemoBaseViewController {

    let chartView = PieChartView()
    let sliderX = UISlider()
    let sliderY = UISlider()
    let sliderTextX = UITextField()
    let sliderTextY = UITextField()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChart()
        // Do any additional setup after loading the view.
        self.title = "Pie Chart"
        
        self.options = [.toggleValues,
                        .toggleXValues,
                        .togglePercent,
                        .toggleHole,
                        .toggleIcons,
                        .animateX,
                        .animateY,
                        .animateXY,
                        .spin,
                        .drawCenter,
                        .saveToGallery,
                        .toggleData]
        
        self.setup(pieChartView: chartView)
        
        chartView.delegate = self
        
        let l = chartView.legend
        l.horizontalAlignment = .right
        l.verticalAlignment = .top
        l.orientation = .vertical
        l.xEntrySpace = 7
        l.yEntrySpace = 0
        l.yOffset = 0
//        chartView.legend = l
        // entry label styling
        chartView.entryLabelColor = .white
        chartView.entryLabelFont = .systemFont(ofSize: 12, weight: .light)
        
        sliderX.value = 4
        sliderY.value = 100
//        self.slidersValueChanged(nil)
        
        chartView.animate(xAxisDuration: 1.4, easingOption: .easeOutBack)
    }
    
    func setupChart(){
        self.view.backgroundColor = .white
        
        self.view.addSubview(stackView)
        
        stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.80).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 150).isActive = true

        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView .centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        
        self.stackView.addArrangedSubview(chartView)
        
        self.stackView.addArrangedSubview(sliderX)
        self.stackView.addArrangedSubview(sliderY)
        self.stackView.addArrangedSubview(sliderTextX)
        self.stackView.addArrangedSubview(sliderTextY)
        
        sliderX.addTarget(self, action: #selector(slidersValueChanged), for: .touchUpInside)
        sliderY.addTarget(self, action: #selector(slidersValueChanged), for: .touchUpInside)


    }
    
    override func updateChartData() {
        if self.shouldHideData {
            chartView.data = nil
            return
        }
        
        self.setDataCount(Int(sliderX.value), range: UInt32(sliderY.value))
    }
    
    func setDataCount(_ count: Int, range: UInt32) {
        let entries = (0..<count).map { (i) -> PieChartDataEntry in
            // IMPORTANT: In a PieChart, no values (Entry) should have the same xIndex (even if from different DataSets), since no values can be drawn above each other.
            return PieChartDataEntry(value: Double(arc4random_uniform(range) + range / 5),
                                     label: parties[i % parties.count],
                                     icon: #imageLiteral(resourceName: "icon"))
        }
        
        let set = PieChartDataSet(entries: entries, label: "Election Results")
        set.drawIconsEnabled = false
        set.sliceSpace = 2
        
        
        set.colors = ChartColorTemplates.vordiplom()
            + ChartColorTemplates.joyful()
            + ChartColorTemplates.colorful()
            + ChartColorTemplates.liberty()
            + ChartColorTemplates.pastel()
            + [UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)]
        
        let data = PieChartData(dataSet: set)
        
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = " %"
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        
        data.setValueFont(.systemFont(ofSize: 11, weight: .light))
        data.setValueTextColor(.white)
        
        chartView.data = data
        chartView.highlightValues(nil)
    }
    
    override func optionTapped(_ option: Option) {
        switch option {
        case .toggleXValues:
            chartView.drawEntryLabelsEnabled = !chartView.drawEntryLabelsEnabled
            chartView.setNeedsDisplay()
            
        case .togglePercent:
            chartView.usePercentValuesEnabled = !chartView.usePercentValuesEnabled
            chartView.setNeedsDisplay()
            
        case .toggleHole:
            chartView.drawHoleEnabled = !chartView.drawHoleEnabled
            chartView.setNeedsDisplay()
            
        case .drawCenter:
            chartView.drawCenterTextEnabled = !chartView.drawCenterTextEnabled
            chartView.setNeedsDisplay()
            
        case .animateX:
            chartView.animate(xAxisDuration: 1.4)
            
        case .animateY:
            chartView.animate(yAxisDuration: 1.4)
            
        case .animateXY:
            chartView.animate(xAxisDuration: 1.4, yAxisDuration: 1.4)
            
        case .spin:
            chartView.spin(duration: 2,
                           fromAngle: chartView.rotationAngle,
                           toAngle: chartView.rotationAngle + 360,
                           easingOption: .easeInCubic)
            
        default:
            handleOption(option, forChartView: chartView)
        }
    }
    
    @objc func slidersValueChanged(_ sender: Any?) {
        sliderTextX.text = "\(Int(sliderX.value))"
        sliderTextY.text = "\(Int(sliderY.value))"

        self.updateChartData()
    }
}
