//
//  ViewController.swift
//  netronixgroup_test
//
//  Created by Roman Resenchuk on 22/02/2018.
//  Copyright © 2018 Roman Resenchuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let cellId = "cell"
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var labelTop: UILabel!
    var arrayEvents: Array<Event> = []
    
    // MARK: Main
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadData()
    }
    
    // MARK: Actions
    func setup() {  
        collectionView.register(UINib.init(nibName: "EventCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellId)
        collectionView.decelerationRate = UIScrollViewDecelerationRateFast
        collectionView.reloadData()
    }
    
    func loadData() {
        APIManager.shared.sseRequest(parameters: [:],
                                     successHandler: { (response) in
                                        let responseArray = response.arrayValue
                                        for responseItem in responseArray {
                                            var event = Event.init()
                                            event.mapping(json: responseItem)
                                            self.arrayEvents.append(event)
                                        }
                                        DispatchQueue.main.async {
                                            self.labelTop.text = "Events count: \(self.arrayEvents.count.description)"
                                            self.collectionView.reloadData()
                                        }
        },
                                     errorHandler: { (error) in
                                        print(error)
        })
    }

    // MARK: Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayEvents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! EventCollectionViewCell
        let item = arrayEvents[indexPath.row]
        cell.configureCell(item: item)
        
        return cell
    }

    

}

