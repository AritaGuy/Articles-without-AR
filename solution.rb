# Please copy/paste all three classes into this file to submit your solution!
class Author
    attr_accessor :name :articles, :magazines
  
    def initialize(name)
      @name = name
    
    end
    
    def articles
      Article.all.select |article|
      article.author == self
      end
    end
  
    def magazines
      articles.each do |article|
       ["#{article.magazine}"].uniq
       
      end
    end
  
    def add_article(magazine, title)
      Article.new(magazine, title)
    end
    
    def topic_areas
      magazines.map do |mag|
        ["#{mag.category}"].uniq
      end
    end
  end

  class Magazine
    attr_accessor :name, :category
    @@all = []
  
    def initialize(name, category)
      @name = name
      @category = category
      @@all = self
    end
    
    def contributors
      Article.all.select do |mag|
      mag.magazine == self
      end.map do |magazine|
        magazine.author
      end
    end
    
    def self.fnd_by_name(name)
      @@all.find do |na|
        na.name == name
      end
    end

    class Article
        attr_accessor :author, :magazine, :title
        @@all = []
         def initialize(author, magazine, title)
            @author = author
            @magazine = magazine
            @title = title
            @@all << self
         end
        
        def self.all
            @@all
        end
        
        end

