module ProductsHelper
  def product_state_with_label product
    content_tag :span, product_state(product), class: "label label-#{product_state_class(product)}"
  end

  def product_state product
    t("activerecord.values.product.state.#{product.state}")
  end

  def product_state_class product
    t("activerecord.values.product.state_class.#{product.state}")
  end
end
