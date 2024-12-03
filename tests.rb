require "rspec"
require "./count_char_frequency"

RSpec.describe "count_char_frequency" do
  let(:file_path) { "input.txt" }

  before do
    File.write("input.txt", file_content)
  end

  after do
    File.delete(file_path) if File.exist?(file_path)
  end

  context "when the file exists" do
    let(:file_content) { "Hello! How are you doing today? Fine, i hope." }

    it "returns correct character frequencies" do
      result = count_char_frequency(file_path)
      expected = {
        " " => 8,
        "o" => 6,
        "e" => 4,
        "i" => 3,
        "H" => 2,
        "a" => 2,
        "d" => 2,
        "l" => 2,
        "n" => 2,
        "y" => 2,
        "!" => 1,
        "," => 1,
        "." => 1,
        "?" => 1,
        "F" => 1,
        "g" => 1,
        "h" => 1,
        "p" => 1,
        "r" => 1,
        "t" => 1,
        "u" => 1,
        "w" => 1
      }

      expect(result).to eq(expected)
    end
  end

  context "when the file is empty" do
    let(:file_content) { "" }

    it "returns an empty hash" do
      result = count_char_frequency(file_path)
      expect(result).to eq({})
    end
  end

  context "when the file doesn't exist" do
    let(:file_path) { "invalid.txt" }
    let(:file_content) { "" }
  
    it "prints an error message and returns nil" do
      expect { count_char_frequency(file_path) }.to output("file not found: invalid.txt\n").to_stdout
  
      result = count_char_frequency(file_path)
      expect(result).to be_nil
    end
  end
end