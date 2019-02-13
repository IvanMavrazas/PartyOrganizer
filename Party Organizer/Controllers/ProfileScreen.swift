//
//  ProfileScreen.swift
//  Party Organizer
//
//  Created by Ivan Mavrazas on 2/11/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit

class ProfileScreen: UIViewController {

    var profiles: Profiles?
    var data: Object?
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var about: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        showProfileDetails()
    }
    
    func populate(withObject object: Profiles?) {
//        profileImage.image = UIImage(named: (object?.photo)!)
        name.text = object?.username
        gender.text = object?.gender
        email.text = object?.email
        about.text = object?.aboutMe
        
    }
    
    func showProfileDetails() {
        self.populate(withObject: profiles)
    }

    @IBAction func addToPartyPressed(_ sender: Any) {
        
    }
    
    func fetchData() {
        guard let url = URL(string: "http://api-coin.quantox.tech/profiles.json") else { return }
        print("url je \(url)")
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil { return }
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            if !(200..<300).contains(httpResponse.statusCode) { return }
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            do {
                let object = try decoder.decode(Object.self, from: data)
                DispatchQueue.main.async {
                    self.data = object
                }
            }
            catch {
                DispatchQueue.main.async {
                    print("ERROR \(error.localizedDescription)")
                    debugPrint(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
}
