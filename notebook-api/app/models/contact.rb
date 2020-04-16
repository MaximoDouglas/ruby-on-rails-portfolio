class Contact < ApplicationRecord
    belongs_to :kind, optional: true
    has_many   :phones

    def author
        "Doug"
    end

    def kind_description
        self.kind != nil ? self.kind.description : ""
    end

    def as_json(options={})
        super(
            root: true,
            include: { 
                kind: { only: :description }, 
                phones: { only: :number } 
            },
            methods: [
                :kind_description, 
                :author
            ])
    end
end
