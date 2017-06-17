require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    class_name.constantize
  end

  def table_name
    self.model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    defaults = {
      foreign_key: "#{name}_id".to_sym,
      class_name: name.to_s.singularize.camelcase,
      primary_key: :id
    }
    defaults.keys.each do |key|
      self.send("#{key}=", options[key] || defaults[key])
    end

    # if options.empty?
    #   @foreign_key = "#{name}_id".to_sym
    #   @class_name = name.to_s.singularize.camelcase
    #   @primary_key = :id
    # else
    #   @foreign_key = options[:foreign_key]
    #   @class_name = options[:class_name]
    #   @primary_key = options[:primary_key]
    # end
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    if options.empty?
      @foreign_key = "#{self_class_name.underscore}_id".to_sym
      @class_name = name.to_s.singularize.camelcase
      @primary_key = :id
    else
      @foreign_key = options[:foreign_key]
      @class_name = options[:class_name]
      @primary_key = options[:primary_key]
    end
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    # options = BelongsToOptions.new(name, options)
    # define_method(name) do
    #   option.foreign_key
      # self.class.table_name
      # foreign_key = options.send(foreign_key)
      # model_class = options.model_class

    # end
  end

  def has_many(name, options = {})
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  extend Associatable
end
