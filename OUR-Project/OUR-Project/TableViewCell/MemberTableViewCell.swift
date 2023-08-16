//
//  MemberTableViewCell.swift
//  OUR-Project
//
//  Created by t2023-m0059 on 2023/08/16.
//

import UIKit

class MemberTableViewCell: UITableViewCell {

    // MARK: - Properties
    var testMember: [String] = ["김상훈", "박인수", "윤혁진", "조영현"]
    @IBOutlet weak var memberTableView: UITableView!
    
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension MemberTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testMember.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = memberTableView.dequeueReusableCell(withIdentifier: "MemberTableViewCell", for: indexPath) as! MemberTableViewCell
        
        return cell
    }
    
    
}
