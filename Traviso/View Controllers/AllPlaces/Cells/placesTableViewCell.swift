//
//  placesTableViewCell.swift
//  Traviso
//
//  Created by aksa nazir on 12/04/21.
//

import UIKit
typealias SeeAllClosure = ((_ index: Int?) -> Void)
typealias DidSelectClosure = ((_ tableIndex: Int?, _ collectionIndex: Int? ) -> Void)


class placesTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var Summer: UILabel!
    
    
    var index: Int?
    var onClickSeeAllClosure: SeeAllClosure?
    var didSelectClosure: DidSelectClosure?

    var visits: Places? {
        didSet {
            
            Summer.text = visits?.Summer
            collectionView.reloadData()
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

         
    }

    
    @IBAction func onClickSeeAll(_ sender: Any) {
        
        onClickSeeAllClosure?(index)
      
    }
    
}

extension placesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return visits?.visits?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaceCollectionViewCell", for: indexPath) as? PlaceCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.placeName.text = visits?.visits?[indexPath.row].name
        cell.img.image = UIImage(named: visits?.visits?[indexPath.row].imageName ?? "" )
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectClosure?(index, indexPath.row)
    }
    
    
    
}















