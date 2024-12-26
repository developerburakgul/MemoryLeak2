//
//  DetailViewController3.swift
//  MemoryLeak2
//
//  Created by Burak Gül on 26.12.2024.
//



import UIKit

extension Notification.Name {
    static let notificationCenterExample = Notification.Name("notificationCenterExample")
}

class DetailViewController3: UIViewController {
    
    var selectedCity: String?
    
    var data: [String] = [
        "İstanbul",
        "Ankara",
        "İzmir",
        "Bursa",
        "Çanakkale",
        "Konya",
        "Tokat",
        "Samsun",
        "Kırıkkale",
        "Kırklareli",
        "Çorum",
        "Denizli",
        "Sivas"
    ]
    
    var tableView: UITableView = {
       let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        print("DetailViewController 3 is inited")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupConstraints()
    }
    
    //MARK: - Setup Functions
    func setupConstraints(){
        setupTableViewConstraints()
    }
    
    func setupTableViewConstraints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    func postNotification(_ userInfo: [String: Any]){
        
//        NotificationCenter.default.post(name: .notificationCenterExample, object: self)
        NotificationCenter.default.post(name: .notificationCenterExample, object: self, userInfo: userInfo)
    }
    deinit {
        print("DetailViewController3 is deinited")
    }
}

//MARK: - TableView Protocols
extension DetailViewController3: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "cell");
        var configuration = UIListContentConfiguration.cell()
        configuration.text = data[indexPath.item]
        cell.contentConfiguration = configuration
        return cell
    }
}
    
extension DetailViewController3: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = data[indexPath.item]
        selectedCity = city
        let userInfo = ["selectedCity": city]
        postNotification(userInfo)
        self.dismiss(animated: true)
    }
}

#Preview("MainViewController"){
    let vc = MainViewController()
    return vc
}

#Preview("DetailViewController3"){
    var vc = DetailViewController3()
    return vc
}



