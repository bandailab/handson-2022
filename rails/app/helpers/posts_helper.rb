module PostsHelper

    def abstract(text, length)
        if text.length > length
            abst = text.slice(0..length)
            abst = abst + "..."
        else
            abst = text
        end
    end 
end
