//
//  PostDataSource.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 1.12.23.
//

import UIKit

class PostDataSource: NSObject, UITableViewDelegate, UITableViewDataSource{
    var postResponse: Welcome?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Number of rows: \(postResponse?.days.count ?? 0)")
        return postResponse?.days.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")! as? PostCell
        cell?.postData = postResponse?.days[indexPath.row]
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
}
