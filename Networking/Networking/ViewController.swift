//
//  ViewController.swift
//  Networking
//
//  Created by Артем Соловьев on 25.12.2021.
//

import UIKit

class ViewController: UIViewController, URLSessionTaskDelegate{
    
    private var countOfPhoto = 0
    private var image = UIImage()
    
    private lazy var urlSession: URLSession = {
        let config = URLSessionConfiguration.background(withIdentifier: "MySession")
        config.isDiscretionary = true
        config.sessionSendsLaunchEvents = true
        return URLSession(configuration: config, delegate: self, delegateQueue: nil)
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        view.alwaysBounceVertical = true
        view.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.id)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/8))
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = " Search..."
        searchBar.isTranslucent = false
        searchBar.backgroundColor = .white
        return searchBar
    }()
    
    override func viewDidLoad() {
//        let backgroundTask = urlSession.downloadTask(with: url)
//        backgroundTask.earliestBeginDate = Date().addingTimeInterval(60 * 60)
//        backgroundTask.countOfBytesClientExpectsToSend = 200
//        backgroundTask.countOfBytesClientExpectsToReceive = 500 * 1024
//        backgroundTask.resume()
        super.viewDidLoad()
        self.view.addSubview(searchBar)
        self.view.addSubview(collectionView)
        collectionView.dataSource = self
        searchBar.delegate = self
        setupSearchBar()
        setupCollection()
        start()
    }
//    func application(_ application: UIApplication,
//                     handleEventsForBackgroundURLSession identifier: String,
//                     completionHandler: @escaping () -> Void) {
//            backgroundCompletionHandler = completionHandler
//    }
//    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
//        DispatchQueue.main.async {
//            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
//                let backgroundCompletionHandler =
//                appDelegate.backgroundCompletionHandler else {
//                    return
//            }
//            backgroundCompletionHandler()
//        }
//    }

    
    private func setupSearchBar(){
        searchBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        searchBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        searchBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        searchBar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
    }
    
    private func setupCollection(){
        collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
         
//        urlSession.downloadTask(with: <#T##URLRequest#>)
    }
    
    func downloadImage(from url: URL) {
        print("Download Started")
        
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                guard  let imageFromNetwork = UIImage(data: data) else {
                    print("non")
                    return
                }
                self?.image = imageFromNetwork
                self?.countOfPhoto += 1
                self!.collectionView.reloadData()
                    print("Download End")
            }
            
        }
    }
    
    func start() {
        let url = URL(string: "https://cdn.arstechnica.net/wp-content/uploads/2018/06/macOS-Mojave-Dynamic-Wallpaper-transition.jpg")!
        let data = "REDMADROROT".data(using: .utf8)!
        
        let tempDir = FileManager.default.temporaryDirectory
        let localURL = tempDir.appendingPathComponent("RMD")
        try? data.write(to: localURL)
        
        let request = URLRequest(url: url)
        let config = URLSessionConfiguration.background(withIdentifier: "uniqueId")
        let session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
        let task = session.uploadTask(with: request, fromFile: localURL)
//        {data, response, error in
//            guard let data = data, error == nil else { return }
//            DispatchQueue.main.async() { [weak self] in
//                guard  let imageFromNetwork = UIImage(data: data) else {
//                    print("non")
//                    return
//                }
//                self?.image = imageFromNetwork
//                self?.countOfPhoto += 1
//                self!.collectionView.reloadData()
//                    print("Download End")
//            }
//            
//            
//        }
        task.resume()
    }
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        print(error?.localizedDescription as Any)
    }
    
}
//"https://cdn.arstechnica.net/wp-content/uploads/2018/06/macOS-Mojave-Dynamic-Wallpaper-transition.jpg"
extension ViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
        let url = URL(string: text)
            downloadImage(from: url!)
        } else {
            
        }
        searchBar.resignFirstResponder()
    }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        countOfPhoto
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.id, for: indexPath) as! CollectionViewCell
        cell.setPhoto(photo: image)
        return cell
        
    }
    
}
