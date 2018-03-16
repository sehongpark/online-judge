# /lib/docker.rb
require 'open3'

module Docker

  def hello
    "hello"
  end

  def ls
    Open3.capture3("docker exec judge ls /root")
  end

  # class method
  def self.judge(code, lang)
    Open3.capture3('docker exec judge run.sh "#{code}" "#{lang}"')
  end
end