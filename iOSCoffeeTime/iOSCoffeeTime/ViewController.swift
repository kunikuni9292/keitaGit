//
//  ViewController.swift
//  iOSCoffeeTime
//
//  Created by 崎原邦達 on 2021/10/09.
//

import UIKit
//セルタップ時の動作
protocol TableViewControllerDelegate: AnyObject {
    func didTapCell(text: String)
}

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: TableViewCell.className, bundle: nil), forCellReuseIdentifier: "cell")
        }
    }
    
    var delegate: TableViewControllerDelegate?
    
    var cafeTitleAyyay = ["小さな街の食堂 cafe MISTY","Color 渋谷店","畳カフェ&バー くまさん家"]
    var cafeDetileArray = ["宮城県仙台市青葉区中央2-6-10 荒岩本店ビル 2F","東京都渋谷区神南1-22-10 皆川ビル 3F","東京都世田谷区北沢2-34-8 KMビル 3F"]
    var cafeImageArray = ["coff2","coff3","coff4"]
    var cafeUrlArray = ["https://tabelog.com/miyagi/A0401/A040101/4002057/","https://tabelog.com/tokyo/A1303/A130301/13170886/","https://tabelog.com/tokyo/A1318/A131802/13195941/",]

    //画面の表示される時の処理(一回しか呼ばれない)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //ピックアップボタンがタップされた時のアクション
    @IBAction func pickUpButton(_ sender: UIButton) {
        let vc = SecondeViewController.instantiate()
               navigationController?.pushViewController(vc, animated: true)
    }
    

}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cafeTitleAyyay.count //カフェの数だけセルを表示する
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.setup(titleText: cafeTitleAyyay[indexPath.row], detailText: cafeDetileArray[indexPath.row], image: UIImage(named: cafeImageArray[indexPath.row] )!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //タップした時の選択色を消す
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
        //外部ブラウザでURLを開く
        let url = NSURL(string: cafeUrlArray[indexPath.row])
        if UIApplication.shared.canOpenURL(url! as URL) {
            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
        }
    }
    
}
