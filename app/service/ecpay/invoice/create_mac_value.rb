module Ecpay
  module Invoice
    class CreateMacValue

      def initialize(inside_params = {})
        @inside_params = inside_params
      end

      def run
        compute_check_mac_value(@inside_params)
      end

      private
      def compute_check_mac_value(hash)
        # 先將參數備份
        hash = hash.dup

        # 轉成 query_string
        query_string = to_query_string(hash)
        # 加上 HashKey 和 HashIV
        query_string = "HashKey=5294y06JbISpM5x9&#{query_string}&HashIV=v77hoKGq4kWxNNIS"
        # 進行 url encode
        raw = urlencode_dot_net(query_string)
        # 套用 SHA256 後轉大寫
        Digest::SHA2.new(256).hexdigest(raw).upcase
      end

      def urlencode_dot_net(raw_data)
        # url encode 後轉小寫
        encoded_data = CGI.escape(raw_data).downcase
        # 調整成跟 ASP.NET 一樣的結果
        encoded_data.gsub!('%21', '!')
        encoded_data.gsub!('%2a', '*')
        encoded_data.gsub!('%28', '(')
        encoded_data.gsub!('%29', ')')
        encoded_data.gsub!('%2d', '-')
        encoded_data.gsub!('%5f', '_')
        encoded_data.gsub!('%2e', '.')
        encoded_data.gsub!('%20', '+')
        encoded_data
      end

      def to_query_string(hash)
        # 對小寫的 key 排序
        hash = hash.sort_by do |key, _val|
          key.downcase
        end

        # 組成 query_string
        hash = hash.map do |key, val|
          "#{key}=#{val}"
        end
        hash.join('&')
      end

    end
  end
end