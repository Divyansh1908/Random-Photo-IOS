//
//  ViewController.swift
//  Trail1 - First trail on swift
//
//  Created by Divyansh Singh on 05/09/22.
//

import UIKit

class ViewController: UIViewController {
    
//Main runnable
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemMint
            // Do any additional setup after loading the view.
            view.addSubview(imageView)
            imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
            imageView.center = view.center
            view.addSubview(button)
            getRandomPhoto()
            button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        }
//working of the button
    @objc func didTapButton(){
        getRandomPhoto()
        view.backgroundColor = colours.randomElement()
    }
//setting button
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 20, y: view.frame.size.height-50-view.safeAreaInsets.bottom, width: view.frame.size.width-40, height: 50)
    }
//imageView
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
//colour array
    let colours: [UIColor] = [.systemRed, .systemGray, .systemBrown, .systemIndigo, .systemCyan, .systemGreen]

//Random Photo
    func getRandomPhoto()
    {
        let urlString = "https://source.unsplash.com/random/600x600" //URL string
        let url = URL(string: urlString)! //  extract url from url string
        guard let data  = try? Data(contentsOf: url) else { //get data from the url
            return
            }
        imageView.image = UIImage(data: data) //put that data in an imageview via UI image
        }
    }
//button
private let button: UIButton = {
    let  button = UIButton()
    button.backgroundColor = .white
    button.setTitle("Random Photo", for: .normal)
    button.setTitleColor(.black, for: .normal)
    return button
}()

