//
//  CalendarCollectionHeaderView.swift
//  Airbnb_iOS
//
//  Created by 김한솔 on 2022/05/30.
//

import UIKit

final class CalendarCollectionHeaderView: UICollectionReusableView {
    private let monthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .init(rawValue: 700))
        return label
    }()

    var baseDate = Date() {
        didSet {
            monthLabel.text = DateConverter.convertToYearAndMonthString(date: baseDate)
        }
    }

    static let identifier = "CollectionHeaderView"

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white
        addSubview(monthLabel)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        NSLayoutConstraint.activate([
            monthLabel.topAnchor.constraint(equalTo: topAnchor),
            monthLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            monthLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            monthLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
