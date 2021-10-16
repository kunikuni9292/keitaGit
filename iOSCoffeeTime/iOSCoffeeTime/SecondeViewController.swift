//
//  SecondeViewController.swift
//  iOSCoffeeTime
//
//  Created by 崎原邦達 on 2021/10/09.
//

import UIKit


class SecondeViewController: UIViewController, StoryBoardInstiatable {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.register(UINib(nibName: CollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: "cell")
        }
    }
    //cafeの画像配列
    var cafeImageArray = ["coff2","coff3","coff4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //ここにURL押した時のアクションを追加する
    @IBAction func didTapUrlButton(_ sender: UIButton) {
        //外部ブラウザでURLを開く
        let url = NSURL(string: "https://mondoor.net/")
        if UIApplication.shared.canOpenURL(url! as URL) {
            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
        }
    }
    
}



extension SecondeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    //コレクションViewの表示する数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cafeImageArray.count
    }
    //コレクションViewに表示する設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        cell.setup(image: UIImage(named: cafeImageArray[indexPath.row] )!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let horizontalSpace : CGFloat = 20
        let cellSize : CGFloat = self.view.bounds.width / 3 - horizontalSpace
        return CGSize(width: cellSize, height: cellSize)
    }
    
    
}
