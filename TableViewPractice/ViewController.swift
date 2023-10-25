//
//  ViewController.swift
//  TableViewPractice
//
//  Created by 하연주 on 2023/10/25.
//

import UIKit

//⭐️ 테이블 뷰 사용할 때에는 UITableViewDataSource 프로토콜 채택해주어야한다.
//UITableViewDataSource : 테이블뷰와 뷰 컨트롤러랑 통신을 할 수 있는 델리게이트 패턴
class ViewController: UIViewController, UITableViewDataSource {
    var moviesArray : [Movie] = [
        Movie(movieImage: UIImage(named: "batman.png"), movieName: "배트맨", movieDescription: "배트맨이 출현하는 영화"),
        Movie(movieImage: UIImage(named: "captain.png"), movieName: "캡틴 아메리카", movieDescription: "캡틴 아메리카의 기원. 캡틴 아메리카는 어떻게 탄생하게 되었을까?"),
        Movie(movieImage: UIImage(named: "ironman.png"), movieName: "아이언맨", movieDescription: "토니 스타크가 출현, 아이언맨이 탄생하게된 계기가 재미있는 영화"),
        Movie(movieImage: UIImage(named: "thor.png"), movieName: "토르", movieDescription: "아스가르드의 후계자 토르가 지구에 오게되는 스토리"),
        Movie(movieImage: UIImage(named: "hulk.png"), movieName: "헐크", movieDescription: "브루스 배너 박사의 실험을 통해 헐크가 탄생하게 되는 영화"),
        Movie(movieImage: UIImage(named: "spiderman.png"), movieName: "스파이더맨", movieDescription: "피터 파커 학생에서 스파이더맨이 되는 과정을 담은 스토리"),
        Movie(movieImage: UIImage(named: "blackpanther.png"), movieName: "블랙펜서", movieDescription: "와칸다의 왕위 계승자 티찰과 블랙펜서가 되다."),
        Movie(movieImage: UIImage(named: "doctorstrange.png"), movieName: "닥터스트레인지", movieDescription: "외과의사 닥터 스트레인지가, 히어로가 되는 과정을 담은 영화"),
        Movie(movieImage: UIImage(named: "guardians.png"), movieName: "가디언즈 오브 갤럭시", movieDescription: "빌런 타노스에 맞서서 세상을 지키려는 가오겔 멤버들")
    ]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //⭐️ 이 테이블 뷰의 대리자가 이 뷰컨트롤러가 된다는 의미
        //⭐️ (UITableViewDataSource 프로토콜 채택해주었기 때문에 반드시 이 코드 넣어주어야 제대로 작동한다)
        tableView.dataSource = self
        tableView.rowHeight = 120
        
    }

    //⭐️ 필수 구현 함수 : numberOfRowsInSection, cellForRowAt
    //numberOfRowsInSection : 몇개의 행을 생성할건지
    //cellForRowAt : 각 행을 어떤 방식으로 표시할건지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //withIdentifier 이 아이덴티파이어는 스토리보드의 cell에 입력해놔야한다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
//        indexPath.section //테이블 뷰에서 그룹화 되어 있는 것
//        indexPath.row //테이블 뷰의 그냥 행
        
        let movie = self.moviesArray[indexPath.row]
        
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.descriptionLabel.text = movie.movieDescription
        
        return cell
    }
    

}

