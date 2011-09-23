require "base"
require 'win32/registry'
require 'windows/registry'

describe "win32stub" do
  it "Should not throw a ruby error with explicit key stuff specified" do
    ourKeyRead = Win32::Registry::Constants::KEY_READ |
		         Windows::Registry::KEY_WOW64_64KEY
    Win32::Registry.open Win32::Registry::HKEY_LOCAL_MACHINE,
                         "mykey",
                         ourKeyRead
    true.should == true
  end

it "Should not throw a ruby error with nothing extra specified" do
    Win32::Registry.open Win32::Registry::HKEY_LOCAL_MACHINE,
                         "mykey"
    true.should == true
  end
end