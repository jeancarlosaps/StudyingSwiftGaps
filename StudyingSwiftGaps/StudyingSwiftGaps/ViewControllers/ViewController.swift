//
//  ViewController.swift
//  StudyingSwiftGaps
//
//  Created by Jean Carlos Antônio Pereira dos Santos on 15/12/20.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    // MARK: - CONSTANTS
    struct Metrics {
        static let buttonTop: CGFloat = 10
        static let buttonLeft: CGFloat = 10
        static let buttonBottom: CGFloat = 10
        static let buttonRight: CGFloat = 10
    }
    
    struct Strings {
        static let buttonTitle = "Select image"
        static let barButtonItemTitle = "Enviar"
    }
    
    // MARK: - PROPERTIES
    
    // MARK: - INITIALIZER
    
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSubViews()
        self.setupConstraints()
        
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: Strings.barButtonItemTitle, style: .plain, target: self, action: #selector(sendImage(_:)))
    }

    // MARK: - UI
    
    private var uploadImageButton: UIButton = {
        let uploadImageButton = UIButton(type: .roundedRect)
        
        uploadImageButton.translatesAutoresizingMaskIntoConstraints = false
        uploadImageButton.setTitle(Strings.buttonTitle, for: .normal)
        uploadImageButton.addTarget(self, action: #selector(takePicture(_:)), for: .touchUpOutside)
        uploadImageButton.setTitleColor(.white, for: .normal)
        uploadImageButton.contentEdgeInsets = UIEdgeInsets(top: Metrics.buttonTop, left: Metrics.buttonLeft, bottom: Metrics.buttonBottom, right: Metrics.buttonRight)
        uploadImageButton.backgroundColor = UIColor.black
        
        return uploadImageButton
    }()
    
    private var imageView: UIView = {
        let imageView = UIView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        
        return imageView
    }()
    
    
    // MARK: - ACTIONS
    
    @objc func takePicture(_ sender: UIButton) {
        print("Abriu imagem")
    }
    
    @objc func sendImage(_ sender: UIBarButtonItem) {
        print("Enviou imagem")
    }
    
    // MARK: SETUP
    
    private func setupSubViews() {
        view.addSubview(uploadImageButton)
        view.addSubview(imageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            uploadImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uploadImageButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
    // MARK: - PUBLIC METHODS
}


// MARK: - EXTENSIONS

