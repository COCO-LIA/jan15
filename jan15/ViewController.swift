//
//  ViewController.swift
//  jan15
//
//  Created by 황현지 on 2021/01/15.
//

import UIKit
import Kingfisher


class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    //
    var nowPlayingDatas = [Movie]()
    var popularDatas = [Movie]()
    var topRatedDatas = [Movie]()
    var upcomingDatas = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMovieApi()
        // Do any additional setup after loading the view.
    }

    //네트워킹
    func getMovieApi() {
//        // nowPlaying
//        MovieAPI.getNowPlaying { (movies) in
//            self.nowPlayingDatas = movies
//            self.tableView.reloadData()
//        }
//
//
//        MovieAPI.getPopular { (movies) in
//            self.popularDatas = movies
//            self.tableView.reloadData()
//        }
//
//        MovieAPI.getTopRated { (movies) in
//            self.topRatedDatas = movies
//            self.tableView.reloadData()
//        }
//
//        MovieAPI.getUpcoming { (movies) in
//            self.upcomingDatas = movies
//            self.tableView.reloadData()
//        }
//
        MovieAPI.getMovieData(target: .nowPlaying) { (movies) in
            self.nowPlayingDatas = movies
            self.tableView.reloadData()
        }
        
        MovieAPI.getMovieData(target: .popular) { (movies) in
            self.popularDatas = movies
            self.tableView.reloadData()
        }
        MovieAPI.getMovieData(target: .topRated) { (movies) in
            self.topRatedDatas = movies
            self.tableView.reloadData()
        }
        MovieAPI.getMovieData(target: .upComing) { (movies) in
            self.upcomingDatas = movies
            self.tableView.reloadData()
        }
        
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return nowPlayingDatas.count
        } else if section == 1 {
            return popularDatas.count
        }
        else if section == 2 {
            return topRatedDatas.count
        } else {
            return upcomingDatas.count
        }
     
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)

            cell1.textLabel?.text = nowPlayingDatas[indexPath.row].title
            cell1.detailTextLabel?.text = nowPlayingDatas[indexPath.row].overview

            return cell1
            
        } else if indexPath.section == 1 {
            
            
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)

            cell2.textLabel?.text = popularDatas[indexPath.row].title

            return cell2
            
        } else if indexPath.section == 2 {
            
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath)

            cell3.textLabel?.text = topRatedDatas[indexPath.row].title
            cell3.detailTextLabel?.text = topRatedDatas[indexPath.row].releaseDate

            return cell3
            
        } else {
            
            let cell4 = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath) as! Cell4
//
//            cell4.textLabel?.text = upcomingDatas[indexPath.row].title
//            cell4.imageView?.image = UIImage(named: "https://image.tmdb.org/t/p/w500\(upcomingDatas[indexPath.row].posterPath)")
            cell4.titleLabel.text = upcomingDatas[indexPath.row].title
            cell4.dataLabel.text = upcomingDatas[indexPath.row].releaseDate
            cell4.descriptionLabel.text = upcomingDatas[indexPath.row].overview
            cell4.imgView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(upcomingDatas[indexPath.row].posterPath)"))
//           
            return cell4
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "UpcomingMovie"
        } else if section == 1 {
            return "PopularMovie"
        } else if section == 2 {
            return "topRated"
        } else {
            return "upcoming"
        }
      
    }
//    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//     
//        
//        
//    }
//    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 3 {
            return 210.0
        } else {
            return 45.0
        }
    }
    
}

