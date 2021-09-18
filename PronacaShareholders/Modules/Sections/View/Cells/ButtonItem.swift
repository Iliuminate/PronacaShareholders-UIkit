//
//  ButtonItem.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 18/09/21.
//

import UIKit

protocol ButtonItemDelegate: AnyObject {
    func leftButtonAction()
    func rightButtonAction()
    func centerButtonAction()
}

enum ButtonItemState {
    case single
    case withObject
}

class ButtonItem: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rigthButton: UIButton!
    @IBOutlet weak var centerLabel: UILabel!
    @IBOutlet weak var centerButton: UIButton!
    
    
    private var numberOfItems: Int = 0
    private var currentWith: CGFloat = 0
    
    weak var delegate: ButtonItemDelegate?

    // MARK: - Lifecycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib()
    }
    
    // MARK: - Private methods -
    private func loadFromNib() {
        Bundle.main.loadNibNamed("ButtonItem", owner: self, options: nil)
        addSubview(self.contentView)
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.contentView.frame = bounds
        self.contentView.layer.cornerRadius = contentView.frame.height * 0.5
        self.contentView.backgroundColor = .red1
        self.contentView.setNeedsLayout()
        currentWith = bounds.width
        self.setupView()
    }
    
    private func setupView() {
        centerLabel.textColor = .white
        leftButton.tintColor = .white
        rigthButton.tintColor = .white
        centerButton.tintColor = .white
    }
    
    private func collapseView() {
        self.contentView.transform = CGAffineTransform.identity
        UIView.animate(withDuration: 0.1,
            animations: {
                self.leftButton.isHidden = true
                self.centerLabel.isHidden = true
                self.rigthButton.isHidden = true
            },
            completion: { _ in
                UIView.animate(withDuration: 0.3) {
                    self.leftButton.isHidden = true
                    self.centerLabel.isHidden = true
                    self.rigthButton.isHidden = true
                    self.centerButton.isHidden = false
                    self.contentView.frame = CGRect(x: self.bounds.width - 30.0, y: 0, width: 30.0, height: self.bounds.height)
                }
            })
    }
    
    private func deployView() {
        UIView.animate(withDuration: 0.1,
            animations: {
                self.leftButton.isHidden = false
                self.centerLabel.isHidden = false
                self.rigthButton.isHidden = false
            },
            completion: { _ in
                UIView.animate(withDuration: 0.3) {
                    self.leftButton.isHidden = false
                    self.rigthButton.isHidden = false
                    self.centerLabel.isHidden = false
                    self.centerButton.isHidden = true
                    self.contentView.transform = CGAffineTransform.identity
                    self.contentView.frame = self.bounds
                }
            })
    }
    
    
    // MARK: - Public methods -
    func configure(numberOfItems items: Int) {
        numberOfItems = items
        centerLabel.text = String(items)
    }
    
    @IBAction func leftButtonAction(_ sender: Any) {
        print("CEDA: - button")
        delegate?.leftButtonAction()
        collapseView()
    }
    
    @IBAction func rightButtonAction(_ sender: Any) {
        print("CEDA: + button")
        delegate?.leftButtonAction()
    }
    
    @IBAction func centerButtonAction(_ sender: Any) {
        print("CEDA: center button")
        delegate?.centerButtonAction()
        deployView()
    }
    
    
}
