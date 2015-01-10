require 'json'

class Parser
	def parse_json(json)
		data = JSON.parse(json)
		volumes = data["items"]
		return volumes
	end

	def parse_info_from_google(volume_info)
		info = Hash.new

        info[:title] = volume_info["title"]
        info[:subtitle] = volume_info["subtitle"]
        info[:authors] = volume_info["authors"]
        info[:published_date] = volume_info["publishedDate"]
        info[:publisher] = volume_info["publisher"]
        info[:description] = volume_info["description"]
        info[:page_count] = volume_info["pageCount"]
        info[:lang] = volume_info["language"]

        isbns = volume_info["industryIdentifiers"]
        if !isbns.nil?
            isbns.each do |isbn|
                if isbn["type"] == "ISBN_13"
                    info[:isbn13] = isbn["identifier"]
                elsif isbn["type"] == "ISBN_10"
                    info[:isbn10] = isbn["identifier"]
                end
            end
        end

        return info
	end
end