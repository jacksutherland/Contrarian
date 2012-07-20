require "spec_helper"

describe SubmissionNotifier do
  describe "contrarian" do
    let(:mail) { SubmissionNotifier.contrarian }

    it "renders the headers" do
      mail.subject.should eq("Contrarian")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "quote" do
    let(:mail) { SubmissionNotifier.quote }

    it "renders the headers" do
      mail.subject.should eq("Quote")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
