class Admins::SearchController < ApplicationController
  def search
  	@model = params["search"]["model"]
    @content = params["search"]["content"]
    @how = params["search"]["how"]
    @datas = search_for(@how, @model, @content)
  end

   private

  def match(model, content)
    if model == 'customer'
      full_name = "select * from Customers where first_name||last_name like '#{content}'"
      Customer.find_by_sql(full_name)
    elsif model == 'item'
      Item.where(name: content)
    end
  end

  def forward(model, content)
    if model == 'customer'
      Customer.where("first_name LIKE ?", "#{content}%")
    elsif model == 'item'
      Item.where("name LIKE ?", "#{content}%")
    end
  end

  def backward(model, content)
    if model == 'customer'
      Customer.where("last_name LIKE ?", "%#{content}")
    elsif model == 'item'
      Item.where("name LIKE ?", "%#{content}")
    end
  end

  def partical(model, content)
    if model == 'customer'
      full_name = "select * from Customers where first_name||last_name like '%#{content}%'"
      Customer.find_by_sql(full_name)
    elsif model == 'item'
      Item.where("name LIKE ?", "%#{content}%")
    end
   end

  def search_for(how, model, content)
    case how
    when 'match'
      match(model, content)
    when 'forward'
      forward(model, content)
    when 'backward'
      backward(model, content)
  	when 'partical'
      partical(model, content)
    end
  end
end

