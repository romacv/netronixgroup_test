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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayEvents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! EventCollectionViewCell
        let item = arrayEvents[indexPath.row]
        
        return cell
    }

    var arrayEvents: Array<Event> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib.init(nibName: "EventCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellId)
        collectionView.reloadData()
        
        APIManager.shared.sseRequest(parameters: [:],
                                     successHandler: { (response) in
                                        let responseArray = response.arrayValue
                                        for responseItem in responseArray {
                                            
                                            var event = Event.init()
                                            event.mapping(json: responseItem)
                                            self.arrayEvents.append(event)
                                        }
                                       DispatchQueue.main.async {
                                        //self.tableView.reloadData()
                                        
                                        self.collectionView.reloadData()
                                        }
                                        //
        },
                                     errorHandler: { (error) in
                                        //
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

