#encoding : utf-8
require 'open-uri'

URL = "http://res.nimg.jp/img/base/head/icon/nico/" 
DIRNAME = "gif"

def getFileName(num)
    zeroPad(num) + ".gif"
end

def zeroPad(num)
    "0" * (3 - num.to_s.size) + num.to_s
end

def argChk

    if(ARGV[0].to_s=="-h" || ARGV[0].to_s=="-help")
        puts <<-DOC

ruby hidariue.rb [fileNumber1] [fileNumber2]

fileNumbers 0 - 999

ruby hidariue.rb
    you get 000.gif - 999.gif

ruby hidariue.rb 100
    you get 100.gif

ruby hidariue.rb 10 20
    you get 010.gif - 020.gif

ruby hidariue.rb -help
    help me erin ( ﾟ∀ ﾟ)o彡゜えーりん！えーりん！

        DOC
        exit
    end

    min = ARGV[0].nil? ? 0 : ARGV[0].to_i
    max = ARGV[1].nil? ? ARGV[0].nil? ? 999 : ARGV[0].to_i : ARGV[1].to_i
    if(999< min || min < 0 || 999< max || max < 0 || max < min)
        puts <<-DOC

hidariue.rb is ArgumentError
ruby hidariue.rb -help

        DOC
        exit
    end
    
    Dir.mkdir(DIRNAME) unless File.exist?(DIRNAME)
    
    return min,max
end


min,max = argChk
(min..max).each{|num|
    open(DIRNAME + "/" + getFileName(num), "w") do |gifFile|
        open(URL + getFileName(num)) do |data|
            gifFile.write(data.read)
        end
    end
    sleep 0.01
}

__END__

