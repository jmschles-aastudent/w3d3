# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

TagTopic.create( :tag_name => "news" )
TagTopic.create( :tag_name => "funny" )
TagTopic.create( :tag_name => "shopping" )
TagTopic.create( :tag_name => "music" )
TagTopic.create( :tag_name => "sports" )