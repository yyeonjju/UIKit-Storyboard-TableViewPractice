//
//  DetailViewController.swift
//  TableViewPractice
//
//  Created by 하연주 on 2023/10/28.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var movieNameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movieData : Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.numberOfLines = 0 //이렇게 하면 글자 수에 따라서 자동으로 line 수 조절

        self.mainImageView.image = movieData?.movieImage
        self.movieNameLabel.text = movieData?.movieName
        self.descriptionLabel.text = movieData?.movieDescription
    }
    


}
