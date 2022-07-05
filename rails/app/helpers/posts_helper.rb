module PostsHelper

    def abstract(text)
        if text.length > 30
            abst = text.slice(0..30)
            abst = abst + "..."
        else
            abst = text
        end
    end 
end
