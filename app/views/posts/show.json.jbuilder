if @update_like_count.present? # @update_like_countに中身があれば
  json.like @update_like_count # 配列かつjson形式で@update_like_countを返す
end