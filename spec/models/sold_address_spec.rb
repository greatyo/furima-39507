require 'rails_helper'

RSpec.describe SoldAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @sold_address = FactoryBot.build(:sold_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@sold_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @sold_address.building_name = ''
        expect(@sold_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空では保存できないこと' do
        @sold_address.post_code = ''
        @sold_address.valid?
        expect(@sold_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeがハイフン無しでは保存できないこと' do
        @sold_address.post_code = '1234567'
        @sold_address.valid?
        expect(@sold_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'post_codeは「3桁ハイフン4桁」でなければ保存できないこと' do
        @sold_address.post_code = '123-45678'
        @sold_address.valid?
        expect(@sold_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'region_idを選択しなければ登録できないこと' do
        @sold_address.region_id = '0'
        @sold_address.valid?
        expect(@sold_address.errors.full_messages).to include("Region can't be blank")
      end
      it 'cityが空では保存できないこと' do
        @sold_address.city = ''
        @sold_address.valid?
        expect(@sold_address.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空では保存できないこと' do
        @sold_address.street_address = ''
        @sold_address.valid?
        expect(@sold_address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'telephoneが空では保存できないこと' do
        @sold_address.telephone = ''
        @sold_address.valid?
        expect(@sold_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneが10桁未満では保存できないこと' do
        @sold_address.telephone = '01235678'
        @sold_address.valid?
        expect(@sold_address.errors.full_messages).to include('Telephone is too short (minimum is 10 characters)')
      end
      it 'telephoneが11桁を超えると保存できないこと' do
        @sold_address.telephone = '012356789012'
        @sold_address.valid?
        expect(@sold_address.errors.full_messages).to include('Telephone is too long (maximum is 11 characters)')
      end
      it 'telephoneは半角数値のみでなければ保存できないこと' do
        @sold_address.telephone = '012-3567-8901'
        @sold_address.valid?
        expect(@sold_address.errors.full_messages).to include('Telephone is not a number')
      end
      it 'tokenが空では保存できないこと' do
        @sold_address.token = ''
        @sold_address.valid?
        expect(@sold_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていなければ購入できない' do
        @sold_address.user_id = nil
        @sold_address.valid?
        expect(@sold_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できない' do
        @sold_address.item_id = nil
        @sold_address.valid?
        expect(@sold_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
