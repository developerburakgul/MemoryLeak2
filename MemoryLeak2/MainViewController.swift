//
//  MainViewController.swift
//  MemoryLeak2
//
//  Created by Burak Gül on 9.12.2024.
//



import UIKit

class MainViewController: UIViewController {
    
    private var closureButton: UIButton = {
        var button = UIButton()
        button.setTitle("Closure", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private var delegateButton: UIButton = {
        var button = UIButton()
        button.setTitle("Delegate", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private var notificationCenterButton: UIButton = {
        var button = UIButton()
        button.setTitle("Notification Center", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.backgroundColor = .systemBackground
    }
    
    
    func setup() {
        setupConstraints()
        closureButton.addTarget(self, action: #selector(clickClosureButton), for: .touchUpInside)
        delegateButton.addTarget(self, action: #selector(clickDelegateButton), for: .touchUpInside)
        notificationCenterButton.addTarget(self, action: #selector(clickNotificationCenterButton), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        setupClosureButtonConstraint()
        setupDelegateButtonConstraint()
        setupNotificationCenterButtonConstraint()
    }
    
    private func setupClosureButtonConstraint() {
        view.addSubview(closureButton)
        closureButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            closureButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            closureButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            closureButton.widthAnchor.constraint(equalToConstant: 200),
            closureButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupDelegateButtonConstraint() {
        view.addSubview(delegateButton)
        delegateButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            delegateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            delegateButton.topAnchor.constraint(equalTo: closureButton.bottomAnchor, constant: 100),
            delegateButton.widthAnchor.constraint(equalToConstant: 200),
            delegateButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupNotificationCenterButtonConstraint() {
        view.addSubview(notificationCenterButton)
        notificationCenterButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            notificationCenterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            notificationCenterButton.topAnchor.constraint(equalTo: delegateButton.bottomAnchor, constant: 100),
            notificationCenterButton.widthAnchor.constraint(equalToConstant: 200),
            notificationCenterButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc func clickClosureButton() {
        let viewController = ViewController()
        viewController.modalPresentationStyle = .overFullScreen
        self.present(viewController, animated: true)
    }
    
    @objc func clickDelegateButton() {
        let viewController2 = ViewController2()
        viewController2.modalPresentationStyle = .overFullScreen
        self.present(viewController2, animated: true)
    }
    
    @objc func clickNotificationCenterButton() {
        let viewController3 = ViewController3()
        viewController3.modalPresentationStyle = .overFullScreen
        self.present(viewController3, animated: true)
    }
}

#Preview("MainViewController"){
    let vc = MainViewController()
    return vc
}

