//
//  ViewController.swift
//  ExemploCollectionViewViewCode
//
//  Created by Renato Yoshinari on 24/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var mySegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: [
            UIImage(systemName: "swift") ?? "",
            UIImage(systemName: "applelogo") ?? ""
        ])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(mySegmentedControlChanged), for: .valueChanged)
        return segmentedControl
    }()

    lazy var myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(
            width: view.frame.size.width / 2 - 23,
            height: view.frame.size.width * 3 / 4 - 23
        )
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.backgroundColor = .black
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mySegmentedControl)
        view.addSubview(myCollectionView)
        configConstraints()
    }

    private func configConstraints() {
        NSLayoutConstraint.activate([
            mySegmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mySegmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 18),
            mySegmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -18),
            
            myCollectionView.topAnchor.constraint(equalTo: mySegmentedControl.bottomAnchor),
            myCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 18),
            myCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -18),
            myCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    @objc private func mySegmentedControlChanged() {
        myCollectionView.reloadData()
    }
}


extension ViewController:  UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell
        
        cell?.configure(
            label: "Swift \(indexPath.row)",
            image: mySegmentedControl.imageForSegment(at: mySegmentedControl.selectedSegmentIndex) ?? UIImage()
        )
        return cell ?? UICollectionViewCell()
    }
}
