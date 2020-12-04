require 'rails_helper'

RSpec.describe UserDonation, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    sleep 1
    @user_donation = FactoryBot.build(:user_donation, user_id: @user.id, item_id: @item.id)
  end

  describe '購入する時' do
    context '購入がうまくいく時' do
      it "全ての値が正しく入力されていれば保存できること" do
        expect(@user_donation).to be_valid
      end
      it "buildingは空でも保存できる" do
        @user_donation.building = nil
        expect(@user_donation).to be_valid
      end
    end

    context '購入がうまくいかない時' do
      it "postalが空だと保存できないこと" do
        @user_donation.postal = nil
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Postal can't be blank")
      end
      it "postalにハイフンがないと保存できないこと" do
        @user_donation.postal = 3300079
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Postal is invalid. Include hyphen(-)")
      end
      it "area_idが空だと保存できないこと" do
        @user_donation.area_id = nil
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Area can't be blank", "Area is not a number")
      end
      it "area_idのidが1の場合登録できない" do
        @user_donation.area_id = 1
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Area must be other than 1")
      end
      it "homeが空だと保存できないこと" do
        @user_donation.home = nil
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Home can't be blank")
      end
      it "home_numberが空だと保存できないこと" do
        @user_donation.home_number = nil
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Home number can't be blank")
      end
      it "numberが空だと保存できないこと" do
        @user_donation.number = nil
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Number can't be blank")
      end
      it "numberにハイフンがあると保存できないこと" do
        @user_donation.number = "080-9870-6596"
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Number is invalid")
      end
      it "numberが12字以上だと保存できないこと" do
        @user_donation.number = "424242424242"
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Number is invalid")
      end
      it "numberが全角数字だと保存できない" do
        @user_donation.number = "０９０８７０６８９５７"
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Number is invalid")
      end
      it "tokenが空だと登録できない" do
        @user_donation.token = nil
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idが空だと登録できない" do
        @user_donation.user_id = nil
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空だと登録できない" do
        @user_donation.item_id = nil
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
