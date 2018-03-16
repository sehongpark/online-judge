# /lib/docker.rb
require 'open3'

module Docker

  def hello
    "hello"
  end

  def ls
    Open3.capture3("docker exec judge ls /root")
  end

  def self.save_code(code)
    "/root/code.txt"
  end

  # class method
  def self.judge(code_path, lang)
    Open3.capture3("docker exec judge run.sh #{code_path} \"#{lang}\"")
  end
end