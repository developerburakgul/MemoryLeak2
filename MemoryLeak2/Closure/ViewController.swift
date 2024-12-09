//
//  ViewController.swift
//  MemoryLeak2
//
//  Created by Burak Gül on 9.12.2024.
//


import UIKit

class ViewController: UIViewController {
    
    var detailViewController: DetailViewController?
    
    //MARK: - UI Elements
    private var fromLabel: UILabel = {
        var label = UILabel()
        label.text = "FROM"
        label.textColor = .systemRed
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    private var fromCityButton: UIButton = {
        var button = UIButton()
        button.setTitle("Select City", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.contentHorizontalAlignment = .leading
        return button
    }()
    private var fromStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    private var toLabel: UILabel = {
        var label = UILabel()
        label.text = "TO"
        label.textColor = .systemRed
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    private var toCityButton: UIButton = {
        var button = UIButton()
        button.setTitle("Select City", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.contentHorizontalAlignment = .leading
        return button
    }()
    private var toStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    private var dismissButton: UIButton = {
        var button = UIButton()
        button.setTitle("DİSMİSS", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.contentHorizontalAlignment = .leading
        return button
    }()
    
    //MARK: - Setup Functions
    func setup() {
        view.backgroundColor = .systemBackground
        setupConstrainst()
        fromCityButton.addTarget(self, action: #selector(clickFromCityButton), for: .touchUpInside)
        toCityButton.addTarget(self, action: #selector(clickToCityButton), for: .touchUpInside)
        dismissButton.addTarget(self, action: #selector(clickDismissButton), for: .touchUpInside)
    }
    
    func setupConstrainst() {
        setupFromStackViewConstraints()
        setupToStackViewConstraints()
        setupDismissButtonConstraints()
    }
    
    func setupFromStackViewConstraints() {
        fromStackView.addArrangedSubview(fromLabel)
        fromStackView.addArrangedSubview(fromCityButton)
    
        view.addSubview(fromStackView)
        fromStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            fromStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            fromStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            fromStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func setupToStackViewConstraints() {
        toStackView.addArrangedSubview(toLabel)
        toStackView.addArrangedSubview(toCityButton)
        
        view.addSubview(toStackView)
        toStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toStackView.topAnchor.constraint(equalTo: fromStackView.bottomAnchor, constant: 20),
            toStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            toStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            
        ])
    }
    
    func setupDismissButtonConstraints(){
        view.addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: toStackView.bottomAnchor, constant: 20),
            dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dismissButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    //MARK: - Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc func clickFromCityButton(){
        if  detailViewController == nil {
            detailViewController = DetailViewController()
        }
        detailViewController?.selectedCity = {  city in
            print("Selected city: \(city)")
            // This strong reference creates a retain cycle
            self.fromCityButton.setTitle(city, for: .normal)
        }
        self.present(detailViewController!, animated: true)
    }
    
    @objc func clickToCityButton(){
        if  detailViewController == nil {
            detailViewController = DetailViewController()
        }
        detailViewController?.selectedCity = { city in
            print("Selected city: \(city)")
            // This strong reference creates a retain cycle
            self.toCityButton.setTitle(city, for: .normal)
        }
        self.present(detailViewController!, animated: true)
    }
    
    @objc func clickDismissButton(){
        self.dismiss(animated: true)
    }
    
    deinit {
        print("ViewController is deinited")
    }
}

#Preview("ClosureViewController"){
    var vc = ViewController()
    return vc
}

