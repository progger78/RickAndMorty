//
//  RMCharactersVC.swift
//  RickAndMorty App
//
//  Created by 1 on 12.08.2023.
//

import UIKit

final class RMCharactersVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        view.backgroundColor = .systemBackground
        let request = RMRequest(endPoint: .character, queryParameters:
        [
        URLQueryItem(name: "name", value: "rick"),
        URLQueryItem(name: "status", value: "alive")]
        )
        
        print(request.url)
        
        RMService.shared.execute(request, expecting: RMCharacter.self, completion: {
            result in
           
        })
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
