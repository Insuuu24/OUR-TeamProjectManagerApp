//
//  ProgressTableViewCell.swift
//  OUR-Project
//
//  Created by t2023-m0059 on 2023/08/16.
//

import UIKit

class ProgressTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    var testProgress: [String] = ["test 1", "test 2", "test 3", "test 4", "test 5"]
    @IBOutlet weak var progressTableView: UITableView!
    
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

extension ProgressTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testProgress.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = progressTableView.dequeueReusableCell(withIdentifier: "ProgressTableViewCell", for: indexPath) as! ProgressTableViewCell
        
        return cell
    }
    
    
}
