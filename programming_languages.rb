def reformat_languages(languages)
  new_hash={}
  languages.each do |oo_or_functional, language_hash|
    #oo, {:ruby=>{...}}
    language_hash.each do |language, type_hash|
      #ruby, {:type=>"interpreted"}
      type_hash.each do |type, string_value|
        #:type, "interpreted"
        if new_hash[language].nil?
            #checks to see if the new_hash we created has ruby/python/etc
          new_hash[language] = {}
            #creates new hash if doesn't exit
        end
        new_hash[language][:style] ||= []
          #create :style key within the language hash on ln 11.  sets :style to empty Array
        new_hash[language][:style] << oo_or_functional
          #adds oo key from first iteration above to the :style
        if new_hash[language][type].nil?
          #if the hash we created doesn't have a type value
        new_hash[language][type] = string_value
          #adds string_value to the :type hash
        end
      end
    end
  end
  new_hash
end
