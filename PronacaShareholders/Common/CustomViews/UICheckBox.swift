//
//  UICheckBox.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 14/09/21.
//

import UIKit

protocol UICheckBoxDelegate: AnyObject {
    func selected(state: Bool, tag: Int)
}

class UICheckBox: UIControl {
    
    // MARK: - Public properties -
    var increasedTouchRadius: CGFloat = 3
    var isChecked: Bool = false { didSet { self.setNeedsDisplay() } }
    weak var delegate: UICheckBoxDelegate?
    
    // MARK: - Private properties -
    lazy var icon: UIImageView = {
        let icon = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        icon.image = UIImage(named: "Vectorcircle")
        return icon
    }()
    
    // MARK: - Lifecycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.setNeedsDisplay()
    }
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setNeedsDisplay()
    }
    
    /// To increase the hit frame for this component
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let relativeFrame = self.bounds
        let hitTestEdgeInsets = UIEdgeInsets(
            top: -increasedTouchRadius,
            left: -increasedTouchRadius,
            bottom: -increasedTouchRadius,
            right: -increasedTouchRadius
        )
        let hitFrame = relativeFrame.inset(by: hitTestEdgeInsets)
        return hitFrame.contains(point)
    }
    
    // MARK: - Private methods -
    private func setUpView() {
        icon.frame.size = self.frame.size
        addSubview(icon)
        addTapGesture()
        backgroundColor = .clear
        
    }
    
    private func addTapGesture() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(sendLocalAction))
        addGestureRecognizer(tapRecognizer)
    }
    
    // MARK: - Actions -
    @objc private func sendLocalAction() {
        isChecked = !isChecked
        icon.image = isChecked ? UIImage(named: "cheked") : UIImage(named: "Vectorcircle")
        delegate?.selected(state: isChecked, tag: self.tag)
    }
}

