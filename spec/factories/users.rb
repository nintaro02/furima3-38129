FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    encrypted_password    {'000000'}
    first_name            {'太郎'}
    first_name_kana       {'タロウ'}
    last_name             {'山田'}
    last_name_kana        {'ヤマダ'}
    birth_day             {'2022/1/1'}
  end
end