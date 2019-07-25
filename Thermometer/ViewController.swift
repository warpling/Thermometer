//
//  ViewController.swift
//  Thermometer
//
//  Created by Ryan McLeod on 7/23/19.
//  Copyright © 2019 Grow Pixel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let stack = UIStackView()
    let fireLabel = UILabel()
    let detailsLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        fireLabel.font = UIFont.systemFont(ofSize: 96)
        fireLabel.textAlignment = .center

        detailsLabel.textColor = UIColor.white
        detailsLabel.textAlignment = .center
        detailsLabel.numberOfLines = 0

        stack.axis = .vertical
        stack.spacing = 20
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

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        switch traitCollection.userInterfaceStyle {
        case .dark:
            view.backgroundColor = UIColor.black
            detailsLabel.textColor = UIColor.white
        case .light, .unspecified:
            fallthrough
        @unknown default:
            view.backgroundColor = UIColor(white: 0.9, alpha: 1)
            detailsLabel.textColor = UIColor.black
        }

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
    }
}

