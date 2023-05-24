//
//  ViewController.swift
//  step8
//
//  Created by Nikolay Volnikov on 22.05.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Private properties

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemGray5
        return scrollView
    }()

    private lazy var imageView: UIImageView = {
        let image = Constants.image
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .systemGray
        return imageView
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = Constants.title

        view.addSubview(scrollView)
        scrollView.contentSize = .init(width: view.frame.width, height: Constants.height)

        navigationController?.navigationBar.prefersLargeTitles = true
        view = scrollView

        imageView.contentMode = .scaleAspectFill
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        guard let subviews = navigationController?.navigationBar.subviews else {
            return
        }

        for subview in subviews {
            if let label = subview.subviews.first(where: { $0 is UILabel }) {
                subview.addSubview(imageView)

                NSLayoutConstraint.activate([
                    imageView.heightAnchor.constraint(equalToConstant: Constants.sizeOfImage),
                    imageView.widthAnchor.constraint(equalToConstant: Constants.sizeOfImage),
                    imageView.trailingAnchor.constraint(equalTo: subview.trailingAnchor, constant: -16),
                    imageView.centerYAnchor.constraint(equalTo: label.centerYAnchor)
                ])
            }
        }
    }

}

fileprivate extension ViewController {

    enum Constants {
        static let title = "Avatar"
        static let image = UIImage(systemName: "person.crop.circle.fill")
        static let sizeOfImage: CGFloat = 36
        static let height: CGFloat = 2000
    }
}
