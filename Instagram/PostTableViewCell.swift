//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by 中島隆斗 on 2018/04/05.
//  Copyright © 2018年 ryuto.nakashima. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentsTextField: UITextField!
    @IBOutlet weak var commentsButton: UIButton!
    @IBOutlet weak var commentsLabel: UILabel!
    
    var postArray: [PostData] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setPostData(_ postData: PostData) {
        self.postImageView.image = postData.image
        
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = formatter.string(from: postData.date!)
        self.dateLabel.text = dateString
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
       
        
        var commentText: String = ""
        for comment in postData.comments {
            if let name = comment["name"] , let comment = comment["comment"]{
                commentText += "\(name) : \(comment)\n"
            }
        }
        self.commentsLabel.text = commentText
    }
}
