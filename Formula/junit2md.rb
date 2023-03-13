# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Junit2md < Formula
  desc "Crazy fast local dev loop."
  homepage "https://github.com/kitproj/junit2md"
  version "0.0.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kitproj/junit2md/releases/download/v0.0.4/junit2md_0.0.4_Darwin_arm64.tar.gz"
      sha256 "81577dc6affef9fe699f54092d75466fb85b2fe5f5488e741c6e029ffa37da74"

      def install
        bin.install "junit2md"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/kitproj/junit2md/releases/download/v0.0.4/junit2md_0.0.4_Darwin_x86_64.tar.gz"
      sha256 "5a1de77811e8d57ced78adcc9028f797477102ca8e05ffbf92b7181eb7f2b5f7"

      def install
        bin.install "junit2md"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/kitproj/junit2md/releases/download/v0.0.4/junit2md_0.0.4_Linux_arm64.tar.gz"
      sha256 "d85c67de28c56645250b1ffd973312303ea1a95230b8ffeada7960bb2f81313d"

      def install
        bin.install "junit2md"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/kitproj/junit2md/releases/download/v0.0.4/junit2md_0.0.4_Linux_x86_64.tar.gz"
      sha256 "19583cedbb07757795dedff459225f18c94b416ac820d4ccbbe66cf7dad2b6d3"

      def install
        bin.install "junit2md"
      end
    end
  end
end
