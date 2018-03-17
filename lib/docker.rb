# /lib/docker.rb
require 'open3'
require 'thread'

module Docker
  # class variable
  @@semaphore = Mutex.new

  def hello
    "hello"
  end

  # class method
  def self.judge(code_path, lang)
    # !가 들어가면 문제가 생김.. bash에서 특별한 의미로 사용..
    # compgen -k에서 나오는 키워드들 문제 안생기게 해야할 듯??
    @@semaphore.synchronize {
      Open3.capture3("docker exec judge run.sh #{code_path} #{lang}")
    }
  end

  def self.save_code(code)
    "/root/code.txt"
  end

  def self.exec(cmd)
    Open3.capture3("docker exec judge #{cmd}")
  end
end