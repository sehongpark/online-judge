# /lib/docker.rb
require 'open3'

module Docker

  def hello
    "hello"
  end

  def ls
    Open3.capture3("docker exec judge ls /root")
  end

#  def self.save_code(code)
#    "/root/code.txt"
#  end

  # class method
  def self.judge(code, lang)
    # !가 들어가면 문제가 생김.. bash에서 특별한 의미로 사용..
    Open3.capture3("docker exec judge run.sh #{code} \"#{lang}\"")
  end

  def self.exec(cmd)
    Open3.capture3("docker exec judge #{cmd}")
  end
end