require 'json'

point_list = []
comment_list = []

def fetch_json(page)
  result = <<`EOS`
    curl --anyauth --user #{ENV['USER']}:#{ENV['PASSWORD']} \
       -H 'content-type: application/json' \
       https://viewer.kintoneapp.com/public/api/records/#{ENV['SUPPORTERZ_ID']}/#{page}
EOS
  JSON.parse(result)
end

def max_page
  data = fetch_json(1)
  data['totalCount'] / data['num'] + 1
end

1.upto(max_page) do |page|
  data = fetch_json(page)
  data['records'].each do |data|
    company = data['company_name']['value']
    points = data['チェックボックス']['value']
    comment = data['presen_opinion']['value']
    points.each do |point|
      point_list << [
        company,
        point,
      ].join("\t")
    end
    comment_list << [
      company,
      comment
    ].join("\t")
  end
end

puts point_list.join("\n") if ARGV[0] == 'point'
puts comment_list.join("\n") if ARGV[0] == 'comment'
