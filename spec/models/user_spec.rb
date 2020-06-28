require 'rails_helper'

RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"

# メールアドレス、パスワードがあれば有効な状態であること
it "is valid with email and password"
# メールアドレスがなければ無効な状態であること
it "is inbalid without email address"
# 重複したメールアドレスなら無効な状態であること
it "is inbalid with a duplicate email address"
# パスワードがなければ無効な状態であること
it "is invalid without password"

end
