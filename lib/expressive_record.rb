module ExpressiveRecord
  def self.included(base)
    base.extend ClassMethods
  end
  
  def express_changes
    ActiveRecord::Base.transaction do
      self.changes.each do |attr, values|
        valuefied = valuefy(attr, values)
        ticket_changes.create(:attribute_type => attr, :old_value => valuefied[0], :new_value => valuefied[1])
      end
    end
  end

  private
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
    def expressify_changes
      before_update do |record|
        record.express_changes
      end
    end
  end