module CheckProductOptionSupport
  def check_db_title_correct
    expect(last_group).to be_present
    expect(last_group.title).to eq('團團圓圓') 
  end

  def check_view_title_correct
    visit my_groups_path
    expect(page).to have_content("團團圓圓")
  end

  def check_db_product_option_correct
    expect(last_group.products.count).to be(1)
    expect(last_group.options.count).to be(1)
    expect(product.name).to eq("紅茶")
    expect(product.price).to be(20)
    expect(option.name).to eq("加椰果")
    expect(option.price).to be(10)
  end

  def check_view_field_correct
    visit edit_group_path(id: last_group.id)
    byebug
    expect(page).to have_field('group[title]', with: "團團圓圓")
    click_on("菜單")
    expect(page).to have_field("group[products_attributes][0][name]", with: "紅茶")
    expect(page).to have_field("group[products_attributes][0][price]", with: "20")
    click_on("選項")
    expect(page).to have_field("group[options_attributes][0][name]", with: "加椰果")
    expect(page).to have_field("group[options_attributes][0][price]", with: "10")
  end

end