//
//  RestaurantsViewController.swift
//  tableViewPractice
//
//  Created by 추만석 on 2021/07/07.
//

import Foundation
import UIKit
import GameplayKit

class RestaurantsViewController: UITableViewController {
    
//    var colorList: [UIColor?] = [UIColor.cyan, UIColor.purple, UIColor.blue, UIColor.brown, UIColor.darkGray]

    let rawData: [[String]] = [["우동사무소","창원 신월동",    "BCEG",    "부담스럽지 않은 가격으로 많이 먹을 수 있음. 커플이 오기도 좋은 분위기. 주차는 길가에 할 수는 있는데, 따로 주차장은 없으므로 접근성이 좋다고는 못하겠음."],
                               ["언양각", "경남도청 사거리 근처",  "ACFG",    "보통의 가격. 적지 않은 양. 음식점 전용 주차장 有. 분위기는 그저 그럼."],
                               ["헤이안", "창원대 앞",    "BCEH",    "아무래도 메뉴가 스시라 가격이 어느정도 있음. 음식 양은 충분함. 분위기 괜찮음. 주차장이 따로 없어 차가 있다면 길가에 대야 함."],
                               ["리코리코", "창원대 앞",    "ACFG",    "학교 바로 앞에 있고, 음료랑 즐기면 양도 딱 맞고 가격도 세트기준 4천원대로 합리적임. 감자튀김을 시키거나 점보로 사이즈업하면 적은 돈으로 포만감 최상"],
                               ["맛두루치기전문점","창원대 앞 우영프라자",   "ACFG",    "근처에 주차자리가 없긴 하나 도보로 가기에는 편함, 인당 6천원에 밑반찬이 많이 나와서 가격 대비 양과 맛에 만족도가 높은 식당. 분위기는 보통 식당"],
                               ["호호돼지국밥","경남도립미술관 근처" ,   "BCFG",   "도보로 거리가 꽤 되며 주차도 힘듬. 그냥 옛날 식당분위기고 점심시간에 가면 웨이팅이 있을 때가 있음. 주위 국밥집 중 먹을만한 국밥집 중 하나임. 가격은 여기가 가장 쌈. 공기밥 리필가능이라 양은 굳."],
                               ["갑진식당" ,  "창원 가로수길",    "BCEH"   , "냉면+육회비빔밥 식당,전용 주차장이 없음. 주차할 곳 찾는게 쫌 걸림. 평균적으로 가격이 쫌 있는 편이지만 육회비빔밥은 주변에 비해 저렴함. 식당 내부 분위기는 상당히 좋은 편임. 양이 은근 많음"],
                               ["송주불냉면", "창원 가로수길",    "BDEG",    "주위에 식당은 많지만 길 양쪽으로 다 주차가 되있어서 주차 하기 힘듬. 양은 보통이며 돈까스까지 시키면 포만감 최상. 분위기도 나름 신경쓴 듯 했고 가격도 주위식당에 비해 저렴했음"],["오브리또","경남대 앞" ,   "ACEG" ,   "학교 바로 앞에 있고, 양도 많은편, 분위기도 좋으며 가격도 싸다"], ["우동한그릇","마산 가포","BCEH"  ,  "자가용으로 10분거리 버스타고 20분거리, 양은 다 못먹을 정도로 많으며, 분위기도 나쁘지 않다, 가격은 다른 우동에 비해 비싼편"],
                               ["정희옥스시",  "경남대 앞"    ,"ADFG",    "학교 바로 앞에 있고,"],
                               ["아윌불백", "경남대 앞" ,   "ADFG"  ,  "학교 바로 앞에 있고,"],
                               ["랑이밥집","경남대 앞","ACFG","학교 바로 앞에 있고,"],
                               ["삼삼밀면","진주경상대 후문"  , "BCFG" ,   "주차가 어려운 위치에 있으며 식당을 찾아 걸어가는 것도 어려운 편에 속함. 만두는 가격에 비해 양이 적다고도 볼 수 있으나 메인메뉴인 밀면들이 양이 많다. 심지어 곱빼기를 하면 엄청 많아진다. 가격은 천원차이. 하지만 식당 내 분위기가 다소 차가운 인테리어로 인해 긍정적인 느낌은 내지 못한다."],
                               ["홍콩반점","진주경상대 정문",    "ADEG"  ,  "주차의 경우 식당이 정문 근처에 바로 있어서 교내 무료주차장에 주차하면 된다. 또한 바로 탁 트이는 공간에 있어 발견하기도 쉽다. 양은 그닥 많다고는 못하겠다. 분위기는 중국집 분위기가 자연스럽다. 가격도 고만고만."],
                               ["돼지랑순대랑","진주경상대 정문" ,  "ACEG"   , "경상대학생들의 대표 맛집. 접근성도 좋고 양도 좋다. 북적북적한게 활발한 한식식당의 분위기를 내어 좋다. 가격도 좋다."],
                               ["옥천식당","경국대칠암 정문"   , "BCFG"   , "주차와 식당찾는게 어려운 장소다. 양은 푸짐하게 많이 주신다. 분위기는 다소 허름하여 불호가 있을 수 있다. 그래도 과기대 학생들의 맛집이다. 가격은 좋다."]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let book1 = Book(title: "직장이 없는 시대가 온다.", price: 7500, writer: "Sara cashler")
//        let book2 = Book(title: "습관의 힘.", price: 9000, writer: "찰스 두히그")
        
//        books.append(book1)
//        books.append(book2)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rawData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let restaurant = Restaurant(name: rawData[indexPath.row][0], meokBTI: rawData[indexPath.row][2], place: rawData[indexPath.row][1],basis: rawData[indexPath.row][3])
        
        
        // MARK: 기본셀로 subtitle 스타일로 만들어 줄 때의 코드 (식당이름,이유)
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
//        cell.textLabel?.text = restaurant.name + "(\(restaurant.meokBTI))"
//        cell.detailTextLabel?.text = restaurant.basis
//        cell.backgroundColor = colorList[indexPath.row % colorList.count ]
        
        // MARK: customcell을 만들어 줄 떄의 코드 (식당이름,먹bti,이유)
        let cell: RestaurantCell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell",for: indexPath) as! RestaurantCell
        
        cell.nameLabel.text = restaurant.name
        cell.meokbtiLabel.text = restaurant.meokBTI
        cell.basisLabel.text = restaurant.basis
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

}



//struct Book {
//    var title: String
//    var price: Int
//    var writer: String
//}

struct Restaurant {
    
    var name: String
    var meokBTI: String
    let place: String
    var basis: String
    
}




