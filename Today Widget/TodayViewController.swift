//
//  TodayViewController.swift
//  Today Widget
//
//  Created by Aled Samuel on 11/08/2019.
//  Copyright © 2019 Grow Pixel. All rights reserved.
//

import UIKit
import NotificationCenter

final class TodayViewController: UIViewController, NCWidgetProviding {
	
	let stack = UIStackView()
	let fireLabel = UILabel()
	let detailsLabel = UILabel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		fireLabel.font = .systemFont(ofSize: 36)
		fireLabel.textAlignment = .center
		
		detailsLabel.font = .systemFont(ofSize: 12)
		detailsLabel.textColor = .label
		detailsLabel.textAlignment = .center
		detailsLabel.numberOfLines = 0
		
		stack.axis = .vertical
		stack.spacing = 6
		stack.distribution = .equalSpacing
		stack.alignment = .center
		stack.addArrangedSubview(fireLabel)
		stack.addArrangedSubview(detailsLabel)
		view.addSubview(stack)
		
		fireLabel.translatesAutoresizingMaskIntoConstraints = false
		detailsLabel.translatesAutoresizingMaskIntoConstraints = false
		stack.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			stack.widthAnchor.constraint(equalToConstant: 300),
			stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
		])
		
		NotificationCenter.default.addObserver(self, selector: #selector(update), name: ProcessInfo.thermalStateDidChangeNotification, object: nil)
		
		update()
	}
	
	func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
		
		completionHandler(NCUpdateResult.newData)
	}
	
	@objc public func update() {
		
		switch ProcessInfo().thermalState {
		case .nominal:
			fireLabel.text = "🥒"
			detailsLabel.text = "Cool as a room temperature cucumber."
		case .fair:
			fireLabel.text = "🔥"
			detailsLabel.text = "Your device is hot. Performance is probably not impacted."
		case .serious:
			fireLabel.text = "🔥🔥"
			detailsLabel.text = "Your device is SERIOUSLY hot. Performance may be impacted."
		case .critical:
			fireLabel.text = "🔥🔥🔥"
			detailsLabel.text = "Your device is CRITICALLY hot. Performance is being impacted."
		@unknown default:
			fireLabel.text = "❓"
			detailsLabel.text = "Thermal state unknown…"
		}
		
		fireLabel.sizeToFit()
		view.setNeedsLayout()
	}
}
