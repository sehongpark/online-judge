# /lib/docker.rb
require 'open3'
require 'thread'
require 'securerandom'

module Docker
  # class variable
  @@semaphore = Mutex.new

  def hello
    "hello"
  end

  # class method
  def self.judge(code_path, lang, args_arr)
    # 특별한 키워드가 들어가면 문제가 생김.. bash에서 특별한 의미로 사용..
    args_str = args_arr.join(" ")
    args_str = arg_str.gsub(/\!|\$|\&|\||\=|\*|\^|\(|\)|\"|\'|\<|\>|\-|\:|\;|\/|\./, " ")
    cmd = "docker exec judge run.sh '#{code_path}' '#{lang}' #{args_str}"
    @@semaphore.synchronize {
      Open3.capture3(cmd)
    }
  end

  def self.save_code(code, lang)
    random_hex = SecureRandom.hex
    dir = "/var/tmp"
    filename = "wrong.file"

    case lang
    when "java"
      filename = "Main#{random_hex}.java"
      code = code.gsub("public class Main", "public class Main#{random_hex}")
      code = code.gsub(".exec(", "")
    else
    end

    full_path = "#{dir}/#{filename}"
    File.write(full_path, code)
    full_path
  end

  def self.exec(cmd)
    Open3.capture3("docker exec judge #{cmd}")
  end
end