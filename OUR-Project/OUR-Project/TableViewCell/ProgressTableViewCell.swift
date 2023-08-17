//
//  ProgressTableViewCell.swift
//  OUR-Project
//
//  Created by t2023-m0059 on 2023/08/16.
//

import UIKit

class ProgressTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    var progressList: [String] = []
    var progressState: [Bool] = []
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressTableView: UITableView!
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        progressTableView.dataSource = self
        progressTableView.delegate = self
        
        progressTableView.separatorStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // MARK: - Method & Action
    func setLabel(name:String){
        progressLabel.text = name
        progressLabel.textColor = .label
        progressLabel.font = .systemFont(ofSize: 15, weight: .regular)
        progressLabel.numberOfLines = 1
        progressLabel.textAlignment = .left
    }
    
    func setStackView(){
        stackView.spacing = 10
    }
    
    func setTableView(){
        progressTableView.layer.borderWidth = 0.25
        progressTableView.layer.borderColor = UIColor.lightGray.cgColor
        progressTableView.layer.cornerRadius = 5.0
    }
}

extension ProgressTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return progressList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = progressTableView.dequeueReusableCell(withIdentifier: "ProgressListTableViewCell", for: indexPath) as! ProgressListTableViewCell
        
        cell.setButton(state: progressState[indexPath.row], name: progressList[indexPath.row])
        
        return cell
    }
}

extension ProgressTableViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}
