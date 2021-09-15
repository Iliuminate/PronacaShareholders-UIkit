//
//  CustomTextField.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 14/09/21.
//

import UIKit

/*
enum TextFieldType {
    case dropdown
    case normal
    case password
}

enum TextFieldState {
    case disabled
    case error
    case focused
    case normal
    case succeded
}

enum ResponderStandardEditActions {
    case cut, copy, paste, select, selectAll, delete

    var selector: Selector {
        switch self {
        case .cut: return #selector(UIResponderStandardEditActions.cut)
        case .copy: return #selector(UIResponderStandardEditActions.copy)
        case .paste: return #selector(UIResponderStandardEditActions.paste)
        case .select: return #selector(UIResponderStandardEditActions.select)
        case .selectAll: return #selector(UIResponderStandardEditActions.selectAll)
        case .delete: return #selector(UIResponderStandardEditActions.delete)
        }
    }
}

class CustomTextField: UITextField {

    // MARK: - Private properties -
    
    private let borderLayer = CAShapeLayer()
    private let clearIcon: String = "Vectorcircle"
    private let disabledColor: UIColor = UIColor.black1
    private let dropdownIcon: String = "Vector"
    private let errorColor: UIColor = UIColor.red1
    private let focusedColor: UIColor = UIColor.green1
    private let hidePasswordIcon: String = "key"
    private let inactiveColor: UIColor = UIColor.black1
    private let padding: CGFloat = 16
    private let showPasswordButton: UIButton = UIButton()
    private let showPasswordIcon: String = "security"
    private let successColor: UIColor = UIColor.green2
    private let leftImagePadding: CGFloat = 6
    private let rightImagePadding: CGFloat = 8
    
    private var editActions: [ResponderStandardEditActions: Bool]?
    private var filterEditActions: [ResponderStandardEditActions: Bool]?
    
    private var heightHelperText: CGFloat {
        return hasHelperText ? 20 : .zero
    }
    
    private var heightTextField: CGFloat {
        guard let height = customHeightTextField else { return 40 }
        return height
    }
    
    private lazy var helperLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: .zero, y: heightTextField, width: frame.width, height: heightHelperText)
        label.font = UIFont(.MontserratRegular, .s12)
        return label
    }()
    
    private var insets: UIEdgeInsets {
        return UIEdgeInsets(top: .zero, left: paddingLeft, bottom: heightHelperText, right: paddingRight)
    }
    
    private var internalStatus: TextFieldState?
    
    private var paddingLeft: CGFloat {
        guard let width = leftView?.bounds.width else { return padding }
        return width + 8
    }
    
    private var paddingRight: CGFloat {
        guard let width = rightView?.bounds.width else { return padding }
        return width
    }
    
    private var updateHeightAnchor: Bool = true
    
    // MARK: - Public properties -
    var customHeightTextField: CGFloat?
    var hasHelperText: Bool = true
    var helperMessage: String = ""
    var type: TextFieldType = .normal
    
    var currentState: TextFieldState? {
        didSet {
            updateState()
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            currentState = isEnabled ? .normal : .disabled
        }
    }
        
    // MARK: - Lifecycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setEditActions(allowed: [.cut, .copy, .paste, .select, .selectAll, .delete])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setEditActions(allowed: [.cut, .copy, .paste, .select, .selectAll, .delete])
    }
    
    override func draw(_ rect: CGRect) {
        setupView()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        setupBorder()
        return bounds.inset(by: insets)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
        
    override func caretRect(for position: UITextPosition) -> CGRect {
        let rect = super.caretRect(for: position)
        return CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.width, height: 22)
    }
    
    override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
       let rect = super.clearButtonRect(forBounds: bounds)
        return CGRect(x: rect.origin.x, y: textInputView.center.y - (rect.height/2), width: rect.width, height: rect.height)
    }

    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.leftViewRect(forBounds: bounds)
        let rectSize = CGSize(width: 20, height: 20)
        return CGRect(
            x: rect.origin.x + leftImagePadding,
            y: (heightTextField/2) - (rectSize.height/2),
            width: rectSize.width,
            height: rectSize.height
        )
    }

    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.rightViewRect(forBounds: bounds)
        let rectSize = CGSize(width: 20, height: 20)
        return CGRect(
            x: rect.origin.x - rightImagePadding,
            y: (heightTextField/2) - (rectSize.height/2),
            width: rectSize.width,
            height: rectSize.height)
    }
    
    @discardableResult
    override func becomeFirstResponder() -> Bool {
        let isFirstResponder = super.becomeFirstResponder()
        currentState = isFirstResponder ? .focused : .normal
        return isFirstResponder
    }
    
    // MARK: - Action -
    
    @objc func showPassword() {
        isSecureTextEntry = !isSecureTextEntry
        setShowPasswordImage()
    }
    
    @objc func setFocusedState() {
        guard currentState == .normal else { return }
        currentState = .focused
    }
    
    @objc func removeFocusedState() {
        guard currentState == .focused else { return }
        currentState = .normal
    }
    
    // MARK: - Private methods -
    
    private func setupView() {
        setStyles()
        setupClearButton()
        if !helperMessage.isEmpty { showHelperMessage() }
        if currentState == nil { currentState = .normal }
        setupType()
        addTarget(self, action: #selector(setFocusedState), for: .editingDidBegin)
        addTarget(self, action: #selector(removeFocusedState), for: .editingDidEnd)
    }
    
    private func setStyles() {
        backgroundColor = UIColor.clear
        font = UIFont(.MontserratRegular, .s16)
        borderStyle = .none
        tintColor = focusedColor
    }

    private func setupClearButton() {
        if let clearButton = value(forKeyPath: "_clearButton") as? UIButton {
            clearButton.setImage(UIImage(named: clearIcon), for: .normal)
        }
        
        if rightViewMode != .always || clearButtonMode != .never {
            clearButtonMode = .whileEditing
        }
    }
    
    private func setupType() {
        switch type {
        case .password: setupShowPasswordButton()
        case .dropdown: setDropdownImage()
        default: break
        }
    }
    
    private func updateHeightAnchorView() {
        if updateHeightAnchor {
            updateHeightAnchor = false
            heightAnchor.constraint(equalToConstant: heightTextField + heightHelperText).isActive = true
        }
    }
    
    private func setupBorder() {
        updateHeightAnchorView()
        
        let rect = CGRect(x: .zero, y: .zero, width: bounds.width, height: heightTextField - 1)
        borderLayer.path = UIBezierPath(roundedRect: rect, cornerRadius: 4).cgPath
        borderLayer.lineCap = .square
        borderLayer.fillColor = nil
        layer.insertSublayer(borderLayer, at: 0)
    }
    
    private func showHelperMessage() {
        helperLabel.textColor = UIColor.black1
        helperLabel.text = helperMessage
        addSubview(helperLabel)
    }

    private func setupShowPasswordButton() {
        isSecureTextEntry = true
        setShowPasswordImage()
        showPasswordButton.frame.size = CGSize(width: 24, height: 24)
        showPasswordButton.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        rightView = showPasswordButton
        rightViewMode = .always
        clearButtonMode = .never
    }
    
    private func setDropdownImage() {
        let dropdownArrow =  UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        dropdownArrow.image = UIImage(named: dropdownIcon)
        rightView = dropdownArrow
        rightViewMode = .always
        clearButtonMode = .never
    }
    
    private func updateState() {
        if type == .normal,
            rightViewMode != .always {
            rightViewMode = .never
        }
        
        borderLayer.lineWidth = 1
        textColor = UIColor.black1
        
        switch currentState {
        case .disabled:
            borderLayer.strokeColor = disabledColor.cgColor
            textColor = UIColor.black2
        case .error:
            borderLayer.strokeColor = errorColor.cgColor
            internalStatus = .error
        case .focused:
            borderLayer.strokeColor = focusedColor.cgColor
            borderLayer.lineWidth = 2
        case .succeded:
            borderLayer.strokeColor = successColor.cgColor
            setRightImage("")
            internalStatus = .succeded
        default:
            guard internalStatus != .error else { return currentState = .error }
            guard internalStatus != .succeded else { return currentState = .succeded }
            
            borderLayer.strokeColor = inactiveColor.cgColor
        }
    }
        
    private func setShowPasswordImage() {
        showPasswordButton.setImage(UIImage(named: isSecureTextEntry ? showPasswordIcon : hidePasswordIcon), for: .normal)
    }
    
    // MARK: - Public Methods -
    
    /// Add an image in rightView.
    /// This function set rightViewMode = .unlessEditing and clearButtonMode = .whileEditing
    /// - Parameter imageName: String
    func setRightImage(_ imageName: String) {
        guard type != .password,
              let image = UIImage(named: imageName) else {
              return
        }
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        rightView = imageView
        rightViewMode = .unlessEditing
        clearButtonMode = .whileEditing
    }
    
    func setLeftImage(_ imageName: String) {
        guard let image = UIImage(named: imageName) else { return }
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        leftView = imageView
        leftViewMode = .always
    }
    
    func showErrorMessage(_ message: String) {
        helperLabel.isHidden = false
        helperLabel.textColor = errorColor
        helperLabel.text = message
        currentState = .error
        if helperMessage.isEmpty {
            addSubview(helperLabel)
        }
    }
    
    func showHelperMessage(_ message: String) {
        helperLabel.isHidden = false
        helperMessage = message
        showHelperMessage()
    }
    
    func hideErrorMessage() {
        helperLabel.text = ""
        internalStatus = .normal
        helperMessage.isEmpty ? helperLabel.removeFromSuperview() : showHelperMessage()
    }
    
    func hideHelperMessage() {
        helperLabel.isHidden = true
    }
    
    // MARK: - Exten functions -
    @IBInspectable var leftImage: UIImage? {
        didSet { updateView() }
    }
    
    @IBInspectable var leftPadding: CGFloat = 0
    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet { updateView() }
    }
}

extension CustomTextField {

    func setEditActions(allowed: [ResponderStandardEditActions]) {
        if self.editActions == nil { editActions = [:] }
        filterEditActions = nil
        allowed.forEach { editActions?[$0] = true }
    }

    func filterEditActions(notAllowed: [ResponderStandardEditActions]) {
        if self.filterEditActions == nil { self.filterEditActions = [:] }
        editActions = nil
        notAllowed.forEach { self.filterEditActions?[$0] = false }
    }

    func resetEditActions() { editActions = nil }

    open override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if let editActions = self.editActions {
            for editAction in editActions where editAction.key.selector == action { return editAction.value }
            return false
        }

        if let filterEditActions = self.filterEditActions {
            for filterEditAction in filterEditActions where filterEditAction.key.selector == action { return filterEditAction.value }
        }

        return super.canPerformAction(action, withSender: sender)
    }
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = .always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.tintColor = color
            leftView = imageView
        } else {
            leftViewMode = .never
            leftView = nil
        }
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
}

 */

class CustomTextField: UITextField {
    
    var customHeightTextField: CGFloat?
    private let leftImagePadding: CGFloat = 6
    private let rightImagePadding: CGFloat = 6
    
    private var insets: UIEdgeInsets {
        return UIEdgeInsets(top: .zero, left: 40, bottom: .zero, right: 30)
    }
    
    private var heightTextField: CGFloat {
        guard let height = customHeightTextField else { return 40 }
        return height
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpStyle()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    func setUpStyle() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.height - 2, width: self.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor.green1.cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomLine)
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.leftViewRect(forBounds: bounds)
        let rectSize = CGSize(width: 20, height: 20)
        return CGRect(
            x: rect.origin.x + leftImagePadding,
            y: (heightTextField/2) - (rectSize.height/2),
            width: rectSize.width,
            height: rectSize.height
        )
    }

    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.rightViewRect(forBounds: bounds)
        let rectSize = CGSize(width: 20, height: 20)
        return CGRect(
            x: rect.origin.x - rightImagePadding,
            y: (heightTextField/2) - (rectSize.height/2),
            width: rectSize.width,
            height: rectSize.height)
    }
    
    func setRightImage(_ imageName: String) {
        guard let image = UIImage(named: imageName) else { return }
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        rightView = imageView
        rightViewMode = .unlessEditing
        clearButtonMode = .whileEditing
    }
    
    func setLeftImage(_ imageName: String) {
        guard let image = UIImage(named: imageName) else { return }
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        leftView = imageView
        leftViewMode = .always
    }
}
