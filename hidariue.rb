#encoding : utf-8
require 'open-uri'

URL = "http://res.nimg.jp/img/base/head/icon/nico/" 
DIRNAME = "gif"

def getFileName(num)
    zeroPad(num) + ".gif"
end

def zeroPad(x)
    "0" * (3 - x.to_s.size) + x.to_s
end

Dir.mkdir(DIRNAME) unless File.exist?(DIRNAME)

(0..999).each{|i|
    open(DIRNAME + "/" + getFileName(i), "w") do |output|
        open(URL + getFileName(i)) do |data|
            output.write(data.read)
        end
    end
    sleep 0.01
}
