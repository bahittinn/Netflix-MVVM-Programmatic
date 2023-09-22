//
//  DownloadsViewController.swift
//  Netflix-MVVM-Programmatic
//
//  Created by Bahittin on 21.07.2023.
//

import UIKit

class DownloadsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Downloads"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    

     
}
