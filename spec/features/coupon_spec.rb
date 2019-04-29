require 'rails_helper'

describe 'Route to view' do
  it 'has an index page' do
    visit cupon_path
    expect(page.status_code).to eq(200)
  end
end

describe 'Multiple coupons are shown' do
  it 'on the index page' do
    Cupon.create(cupon_code: "ASD123", store: "Chipotle")
    Cupon.create(cupon_code: "XYZ098", store: "Jamba")
    visit cupons_path
    expect(page).to have_content(/Chipotle|Jamba/)
  end
end

describe 'form page' do
  it 'form renders with the new action' do
    visit new_cupon_path
    expect(page).to have_content("Cupon Form")
  end

  it 'new form submits content and renders form content' do
    visit new_cupon_path

    fill_in 'cupon[cupon_code]', with: "YAYFREE"
    fill_in 'cupon[store]', with: "Hobby Lobby"

    click_on "Submit Cupon"

    expect(page).to have_content("YAYFREE")
  end

  it 'creates a record in the database' do
    visit new_cupon_path

    fill_in 'cupon[cupon_code]', with: "FREEITEM"
    fill_in 'cupon[store]', with: "Quip"

    click_on "Submit Cupon"

    expect(Cupon.last.store).to eq("Quip")
  end
end

describe 'Show page' do
  before do
    @cupon = Cupon.create(cupon_code: "FREESTUFF", store: "Chipotle")
  end

  it 'renders properly' do
    visit cupon_path(@cupon)
    expect(page.status_code).to eq(200)
  end

  it 'renders the coupon code in a h1 tag' do
    visit cupon_path(@cupon)
    expect(page).to have_css("h1", text: "FREESTUFF")
  end

  it 'renders the store name in a h1 tag' do
    visit cupon_path(@cupon)
    expect(page).to have_css("h1", text: "Chipotle")
  end
end

describe 'linking from the index page to the show page' do
  it 'index page links to coupon page' do
    linked_cupon = Cupon.create(cupon_code: "FREESTUFF", store: "Chipotle")
    visit cupons_path
    expect(page).to have_link(linked_cupon.cupon_code, href: cupon_path(linked_cupon))
  end
end
