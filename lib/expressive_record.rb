module ExpressiveRecord
  def self.included(base)
    base.extend ClassMethods
  end

  private
  
    # convention: the has_many association is named, i.e. ticket_changes, for model Ticket
    def expressify(has_many_assoc = nil)
      ActiveRecord::Base.transaction do
        self.changes.each do |attr, values|
          valuefied = valuefy(attr, values)
          assoc_name = has_many_assoc || "#{self.class.to_s.downcase}_changes"
          assoc = self.send(assoc_name.to_sym)
          assoc.create(:attribute_type => attr, :old_value => valuefied[0], :new_value => valuefied[1])
        end
      end
    end
  
  #    find association's meaningful value (i.e. user.name instead of user id)
    def valuefy(attr, values, assoc_attr = :name)
  #      TODO: is there a better way to determine if an attr is an association
      if attr.ends_with?('_id')
        assoc = self.send(attr.gsub(/_id$/,'').to_sym)
        return [(values[0].nil? ? '-' : assoc.class.find(values[0]).send(assoc_attr)), assoc.class.find(values[1]).send(assoc_attr)]
      else
        return values
      end
    end

  module ClassMethods
    def express_changes(has_many_assoc = nil)
      define_method(:before_update) { expressify has_many_assoc }
    end
  end
end