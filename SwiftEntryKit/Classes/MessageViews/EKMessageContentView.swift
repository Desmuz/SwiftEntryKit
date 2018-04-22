//
//  EKMessageContentView.swift
//  SwiftEntryKit
//
//  Created by Daniel Huri on 4/19/18.
//  Copyright (c) 2018 huri000@gmail.com. All rights reserved.
//

import UIKit
import QuickLayout

public class EKMessageContentView: UIView {
    
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    
    private var horizontalConstraints: QLAxisConstraints!
    private var topConstraint: NSLayoutConstraint!
    private var bottomConstraint: NSLayoutConstraint!
    
    public var titleContent: EKProperty.LabelContent! {
        didSet {
            titleLabel.labelContent = titleContent
        }
    }
    
    public var subtitleContent: EKProperty.LabelContent! {
        didSet {
            subtitleLabel.labelContent = subtitleContent
        }
    }
    
    public var titleAttributes: EKProperty.Label! {
        didSet {
            titleLabel.attributes = titleAttributes
        }
    }
    
    public var subtitleAttributes: EKProperty.Label! {
        didSet {
            subtitleLabel.attributes = subtitleAttributes
        }
    }
    
    public var title: String! {
        didSet {
            titleLabel.text = title
        }
    }
    
    public var subtitle: String! {
        didSet {
            subtitleLabel.text = subtitle
        }
    }
    
    public var verticalMargins: CGFloat = 20 {
        didSet {
            topConstraint.constant = verticalMargins
            bottomConstraint.constant = -verticalMargins
            layoutIfNeeded()
        }
    }
    
    public var horizontalMargins: CGFloat = 20 {
        didSet {
            horizontalConstraints.first.constant = horizontalMargins
            horizontalConstraints.second.constant = -horizontalMargins
            layoutIfNeeded()
        }
    }
    
    public init() {
        super.init(frame: UIScreen.main.bounds)
        clipsToBounds = true
        setupTitleLabel()
        setupSubtitleLabel()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.numberOfLines = 0
        topConstraint = titleLabel.layoutToSuperview(.top, offset: verticalMargins)
        horizontalConstraints = titleLabel.layoutToSuperview(axis: .horizontally, offset: horizontalMargins)
        titleLabel.verticalHuggingPriority = .must
    }
    
    private func setupSubtitleLabel() {
        addSubview(subtitleLabel)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.layout(.top, to: .bottom, of: titleLabel, offset: 10)
        subtitleLabel.layout(to: .left, of: titleLabel)
        subtitleLabel.layout(to: .right, of: titleLabel)
        bottomConstraint = subtitleLabel.layoutToSuperview(.bottom, offset: -verticalMargins, priority: .must)
        subtitleLabel.verticalHuggingPriority = .must
    }
}