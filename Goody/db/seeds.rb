# db/seeds.rb
# require File.expand_path '../../core/user', __FILE__
require File.expand_path '../../core/user', __FILE__
require File.expand_path '../../core/like_status', __FILE__
require File.expand_path '../../core/article', __FILE__
users = [
    {fname: 'Jon', lname: 'Doe', email: 'e@example.com'},
    {fname: 'Jane', lname: 'Doe', email: 'e@example.com'}
]

users.each do |u|
  User.create(u)
end

like_status = [
    {user_id: '1', article_id: '8', status: '1', created: '2016-04-11 10:18:53', modified: '2016-04-11 10:18:53'},
    {user_id: '2', article_id: '8', status: '1', created: '2016-04-11 10:18:53', modified: '2016-04-11 10:18:53'},
    {user_id: '3', article_id: '8', status: '1', created: '2016-04-11 10:18:53', modified: '2016-04-11 10:18:53'},
    {user_id: '4', article_id: '8', status: '1', created: '2016-04-11 10:18:53', modified: '2016-04-11 10:18:53'},
    {user_id: '5', article_id: '8', status: '1', created: '2016-04-11 10:18:53', modified: '2016-04-11 10:18:53'},
    {user_id: '6', article_id: '8', status: '1', created: '2016-04-11 10:18:53', modified: '2016-04-11 10:18:53'},
    {user_id: '7', article_id: '8', status: '1', created: '2016-04-11 10:18:53', modified: '2016-04-11 10:18:53'},
    {user_id: '8', article_id: '8', status: '1', created: '2016-04-11 10:18:53', modified: '2016-04-11 10:18:53'},
    {user_id: '9', article_id: '8', status: '1', created: '2016-04-11 10:18:53', modified: '2016-04-11 10:18:53'},
    {user_id: '10', article_id: '8', status: '1', created: '2016-04-11 10:18:53', modified: '2016-04-11 10:18:53'}
]

like_status.each do |u|
  LikeStatus.create(u)
end

article = [
    {numberic: 3,title: '記事タイトル１ 1', art_img:'1.png', link_url: '', attention: 1, browse_restriction: 0, description: '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１</p>\r\n',category: '1',status: 1,public: '2016-06-03 14:52:38', created: '2016-04-11 04:54:55', modified:'2017-04-14 03:52:56', del_flg: 0, display_flg: 0},
    {numberic: 3,title: '記事タイトル１ 2', art_img:'2.png', link_url: '', attention: 1, browse_restriction: 0, description: '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１</p>\r\n',category: '1',status: 1,public: '2016-06-03 14:52:38', created: '2016-04-11 04:54:55', modified:'2017-04-14 03:52:56', del_flg: 0, display_flg: 0},
    {numberic: 3,title: '記事タイトル１ 3', art_img:'3.png', link_url: '', attention: 1, browse_restriction: 0, description: '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１</p>\r\n',category: '1',status: 1,public: '2016-06-03 14:52:38', created: '2016-04-11 04:54:55', modified:'2017-04-14 03:52:56', del_flg: 0, display_flg: 0},
    {numberic: 3,title: '記事タイトル１ 4', art_img:'4.png', link_url: '', attention: 1, browse_restriction: 0, description: '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１</p>\r\n',category: '1',status: 1,public: '2016-06-03 14:52:38', created: '2016-04-11 04:54:55', modified:'2017-04-14 03:52:56', del_flg: 0, display_flg: 0},
    {numberic: 3,title: '記事タイトル１ 5', art_img:'5.png', link_url: '', attention: 1, browse_restriction: 0, description: '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１</p>\r\n',category: '1',status: 1,public: '2016-06-03 14:52:38', created: '2016-04-11 04:54:55', modified:'2017-04-14 03:52:56', del_flg: 0, display_flg: 0},
    {numberic: 3,title: '記事タイトル１ 6', art_img:'6.png', link_url: '', attention: 1, browse_restriction: 0, description: '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１</p>\r\n',category: '1',status: 1,public: '2016-06-03 14:52:38', created: '2016-04-11 04:54:55', modified:'2017-04-14 03:52:56', del_flg: 0, display_flg: 0},
    {numberic: 3,title: '記事タイトル１ 7', art_img:'7.png', link_url: '', attention: 1, browse_restriction: 0, description: '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１</p>\r\n',category: '1',status: 1,public: '2016-06-03 14:52:38', created: '2016-04-11 04:54:55', modified:'2017-04-14 03:52:56', del_flg: 0, display_flg: 0},
    {numberic: 3,title: '記事タイトル１ 8', art_img:'8.png', link_url: '', attention: 1, browse_restriction: 0, description: '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１</p>\r\n',category: '1',status: 1,public: '2016-06-03 14:52:38', created: '2016-04-11 04:54:55', modified:'2017-04-14 03:52:56', del_flg: 0, display_flg: 0},
    {numberic: 3,title: '記事タイトル１ 9', art_img:'9.png', link_url: '', attention: 1, browse_restriction: 0, description: '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１</p>\r\n',category: '1',status: 1,public: '2016-06-03 14:52:38', created: '2016-04-11 04:54:55', modified:'2017-04-14 03:52:56', del_flg: 0, display_flg: 0},
    {numberic: 3,title: '記事タイトル１ 10', art_img:'10.png', link_url: '', attention: 1, browse_restriction: 0, description: '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１</p>\r\n',category: '1',status: 1,public: '2016-06-03 14:52:38', created: '2016-04-11 04:54:55', modified:'2017-04-14 03:52:56', del_flg: 0, display_flg: 0}
]

article.each do |u|
  Article.create(u)
end

# article = [
#     {numberic: 3,title: '記事タイトル１ 1', art_img:'1.png', link_url: '', attention: 1, browse_restriction: 0, description: '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１</p>\r\n',category: '1',status: 1,public: '2016-06-03 14:52:38', created: '2016-04-11 04:54:55', modified:'2017-04-14 03:52:56', del_flg: 0, display_flg: 0},
#     {numberic: 3,title: '記事タイトル１ 2', art_img:'2.png', link_url: '', attention: 1, browse_restriction: 0, description: '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１</p>\r\n',category: '1',status: 1,public: '2016-06-03 14:52:38', created: '2016-04-11 04:54:55', modified:'2017-04-14 03:52:56', del_flg: 0, display_flg: 0},
#     {numberic: 3,title: '記事タイトル１ 3', art_img:'3.png', link_url: '', attention: 1, browse_restriction: 0, description: '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１</p>\r\n',category: '1',status: 1,public: '2016-06-03 14:52:38', created: '2016-04-11 04:54:55', modified:'2017-04-14 03:52:56', del_flg: 0, display_flg: 0},
#     {numberic: 3,title: '記事タイトル１ 4', art_img:'4.png', link_url: '', attention: 1, browse_restriction: 0, description: '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１</p>\r\n',category: '1',status: 1,public: '2016-06-03 14:52:38', created: '2016-04-11 04:54:55', modified:'2017-04-14 03:52:56', del_flg: 0, display_flg: 0},
#     {numberic: 3,title: '記事タイトル１ 5', art_img:'5.png', link_url: '', attention: 1, browse_restriction: 0, description: '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１</p>\r\n',category: '1',status: 1,public: '2016-06-03 14:52:38', created: '2016-04-11 04:54:55', modified:'2017-04-14 03:52:56', del_flg: 0, display_flg: 0},
#     {numberic: 3,title: '記事タイトル１ 6', art_img:'6.png', link_url: '', attention: 1, browse_restriction: 0, description: '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１</p>\r\n',category: '1',status: 1,public: '2016-06-03 14:52:38', created: '2016-04-11 04:54:55', modified:'2017-04-14 03:52:56', del_flg: 0, display_flg: 0},
#     {numberic: 3,title: '記事タイトル１ 7', art_img:'7.png', link_url: '', attention: 1, browse_restriction: 0, description: '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１</p>\r\n',category: '1',status: 1,public: '2016-06-03 14:52:38', created: '2016-04-11 04:54:55', modified:'2017-04-14 03:52:56', del_flg: 0, display_flg: 0},
#     {numberic: 3,title: '記事タイトル１ 8', art_img:'8.png', link_url: '', attention: 1, browse_restriction: 0, description: '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１</p>\r\n',category: '1',status: 1,public: '2016-06-03 14:52:38', created: '2016-04-11 04:54:55', modified:'2017-04-14 03:52:56', del_flg: 0, display_flg: 0},
#     {numberic: 3,title: '記事タイトル１ 9', art_img:'9.png', link_url: '', attention: 1, browse_restriction: 0, description: '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１</p>\r\n',category: '1',status: 1,public: '2016-06-03 14:52:38', created: '2016-04-11 04:54:55', modified:'2017-04-14 03:52:56', del_flg: 0, display_flg: 0},
#     {numberic: 3,title: '記事タイトル１ 10', art_img:'10.png', link_url: '', attention: 1, browse_restriction: 0, description: '<p>記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１記事説明１</p>\r\n',category: '1',status: 1,public: '2016-06-03 14:52:38', created: '2016-04-11 04:54:55', modified:'2017-04-14 03:52:56', del_flg: 0, display_flg: 0}
# ]
#
# article.each do |u|
#   Article.create(u)
# end