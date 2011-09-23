module Win32
  class Registry
    module Constants
      KEY_READ = 0x00
      HKEY_LOCAL_MACHINE = 0x02
    end

    include Constants
    def self.open(hkey, subkey, desired = "default provided in code", opt ="optional")
    end
  end
end