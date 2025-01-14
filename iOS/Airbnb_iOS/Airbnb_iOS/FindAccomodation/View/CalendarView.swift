//
//  CalendarView.swift
//  Airbnb_iOS
//
//  Created by 김한솔 on 2022/05/30.
//

import UIKit

final class CalendarView: UIView {
    private let monthCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white

        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        monthCollectionView.register(CalendarCollectionCell.self, forCellWithReuseIdentifier: CalendarCollectionCell.identifier)
        monthCollectionView.register(CalendarCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CalendarCollectionHeaderView.identifier)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(monthCollectionView)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    func reloadData() {
        DispatchQueue.main.async {
            self.monthCollectionView.reloadData()
        }
    }

    func reloadItems(at indexPaths: [IndexPath]) {
        DispatchQueue.main.async {
            self.monthCollectionView.reloadItems(at: indexPaths)
        }
    }

    func setCollectionViewDelegate(_ delegate: UICollectionViewDelegateFlowLayout) {
        monthCollectionView.delegate = delegate
    }

    func setCollectionViewDataSource(_ dataSource: UICollectionViewDataSource) {
        monthCollectionView.dataSource = dataSource
    }

    override func layoutSubviews() {
        NSLayoutConstraint.activate([
            monthCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            monthCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            monthCollectionView.topAnchor.constraint(equalTo: topAnchor),
            monthCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
