class Topic < ApplicationRecord


 has_many :posts

 acts_as_taggable 

 enum category:{
    スポーツ: 0,
    国際: 1,
    国内: 2,
    趣味: 3,
    その他: 4
  }



end
