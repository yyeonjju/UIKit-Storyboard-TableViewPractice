//
//  ViewController.swift
//  TableViewPractice
//
//  Created by 하연주 on 2023/10/25.
//

import UIKit

//⭐️ 테이블 뷰 사용할 때에는 UITableViewDataSource 프로토콜 채택해주어야한다.
//UITableViewDataSource : 테이블뷰와 뷰 컨트롤러랑 통신을 할 수 있는 델리게이트 패턴
class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var moviesArray : [Movie] = []
    var movieDataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupDatas()
        title = "영화목록"
        
    }
    
    //⭐️ 테이블뷰 아래에 데이터 추가할 때 중요!
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        movieDataManager.addMovieData()  // 일반적으로는 서버에 요청 (데이터 업데이트)
        moviesArray = movieDataManager.getMovieData()  // 다시 데이터 받아서 뷰컨의 배열에 저장
        tableView.reloadData()   // 테이블뷰를 다시 불러오기
        
    }
    
    func setupTableView() {
        //⭐️ 이 테이블 뷰의 대리자가 이 뷰컨트롤러가 된다는 의미
        //⭐️ (UITableViewDataSource 프로토콜 채택해주었기 때문에 반드시 이 코드 넣어주어야 제대로 작동한다)
        // 델리게이트 패턴의 대리자 설정
        tableView.dataSource = self
        tableView.delegate = self
        // 셀의 높이 설정
        tableView.rowHeight = 120
    }

    func setupDatas() {
        movieDataManager.makeMovieData() // 일반적으로는 서버에 요청
        moviesArray = movieDataManager.getMovieData()  // 데이터 받아서 뷰컨의 배열에 저장
    }
}

extension ViewController : UITableViewDataSource {
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

extension ViewController: UITableViewDelegate {
    
    // 셀이 선택이 되었을때 어떤 동작을 할 것인지 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 세그웨이를 실행
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    // prepare세그웨이(데이터 전달)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailViewController
            let index = sender as! IndexPath
            
            // 배열에서 아이템을 꺼내서, 다음화면으로 전달
            detailVC.movieData = moviesArray[index.row]
        }
    }
}
