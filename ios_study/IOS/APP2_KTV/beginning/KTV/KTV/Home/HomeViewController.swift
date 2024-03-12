//
//  HomeViewController.swift
//  KTV
//
//  Created by 정채연 on 3/11/24.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate {

    
    @IBOutlet weak var collectionView: UICollectionView!
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent}
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {.portrait}
    
    //view controller와 같은 경우 ui에 대한 제어를 viewDidLoad에서 해준다.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
    }
    

   func setupTableView()
    {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(
            UINib(nibName: HomeVideoCell.identifier,
                  bundle: nil),
            forCellWithReuseIdentifier: HomeVideoCell.identifier
                 )
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = HomeSection(rawValue: section) else {
            return 0
        }
        switch section {
        case .video:
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let section = HomeSection(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }
        switch section {
        case .video:
            return collectionView.dequeueReusableCell(withReuseIdentifier: HomeVideoCell.identifier, for: indexPath)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        HomeSection.allCases.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = HomeSection(rawValue: section) else {
            return 0
        }
        switch section {
        case .video:
            return 2
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = HomeSection(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        switch section {
        case .video:
            return tableView.dequeueReusableCell(withIdentifier: HomeVideoCell.identifier, for: indexPath)
        }
    }
    
    
}
