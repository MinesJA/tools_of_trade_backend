require 'rails_helper'

RSpec.describe Tool, :type => :model do



  describe "attributes" do
    before(:each) do
      @valid_tool = Tool.create(name: "Javascript", description: "A programming language.", url: "www.javascript.com")
      @no_name = Tool.create(description: "A programming language.", url: "www.javascript.com")
      @no_description = Tool.create(description: "A programming language.", url: "www.javascript.com")
      @no_url = Tool.create(name: "Ruby", description: "A programming language.")
    end

    after(:each) do
      Tool.destroy_all
    end

    it "is valid with valid attributes" do
      expect(@valid_tool).to be_valid
    end

    it "is not valid without a name" do
      expect(@no_name).to be_invalid
    end

    it "is not valid without a description" do
      expect(@no_description).to be_invalid
    end
    it "is not vlaid without a url" do
      expect(@no_url).to be_invalid
    end

  end

  describe "#index" do

    before(:each) do

      10.times do
        @one = Tool.create(name: , description: , url: , upvotes: , downvotes: )
      end

      @one = Tool.create(name: , description: , url: , upvotes: , downvotes: )
      @one = Tool.create(name: , description: , url: , upvotes: , downvotes: )
      @one = Tool.create(name: , description: , url: , upvotes: , downvotes: )
      @one = Tool.create(name: , description: , url: , upvotes: , downvotes: )
      @one = Tool.create(name: , description: , url: , upvotes: , downvotes: )
      @one = Tool.create(name: , description: , url: , upvotes: , downvotes: )
      @one = Tool.create(name: , description: , url: , upvotes: , downvotes: )
      @one = Tool.create(name: , description: , url: , upvotes: , downvotes: )
      @one = Tool.create(name: , description: , url: , upvotes: , downvotes: )
      @one = Tool.create(name: , description: , url: , upvotes: , downvotes: )
    end

  end

  # describe "#index" do
  #
  #   before(:each) do
  #     # User.count = 2
  #     # Tool.count = 7
  #     # Faker
  #     @fontPair = Tool.create(
  #       name: "Font Pair",
  #       description: "Font Pair is a great tool that lets your pair Google Fonts. It gives you visual examples of font pairings and is very easily navigated and filtered. Definitely worth checking out.",
  #       url: "https://fontpair.co/",
  #       upvotes: 5,
  #       downvotes: 5
  #     )
  #
  #     @typio = Tool.create(
  #       name:"Typ.io",
  #       description:"A really rich and cool font discovery tool. Typ.io boasts more than 2,248 type samples, that have been assembled into a bunch of lists to help you choose fonts for your next project.",
  #       url:"http://typ.io/",
  #       upvotes: 30,
  #       downvotes: 27
  #     )
  #
  #     @reactSketch = Tool.create(
  #       name:"React Sketch.app",
  #       description:"React Sketchapp renders React components to Sketch in real time.",
  #       url: "http://airbnb.io/react-sketchapp/?ref=stackshare",
  #       upvotes: 5,
  #       downvotes: 3
  #     )
  #
  #     @element = Tool.create(
  #       name:"Element",
  #       description:"A Vue 2.0-based desktop UI library, Element was built by the engineers at Ele.me, 'one of the biggest food delivery companies in China.''",
  #       url: "http://element.eleme.io/#/en-US",
  #       upvotes: 10,
  #       downvotes: 5
  #     )
  #
  #     @feather = Tool.create(
  #       name:"Feather",
  #       description:"Feather is a simple open source collection of icons.",
  #       url:"https://feathericons.com/",
  #       upvotes: 10,
  #       downvotes: 6
  #     )
  #
  #     @hammer = Tool.create(
  #       name:"Hammer.js",
  #       description: "Add touch gestures to your webapp.",
  #       url:"http://hammerjs.github.io/",
  #       upvotes: 10,
  #       downvotes: 7
  #     )
  #
  #     @localStack = Tool.create(
  #       name:"LocalStack",
  #       description:"LocalStack is a fully functional local AWS cloud stack by none other than the good folks over at Atlassian. Features include continuous integration, cost-effective testing, and speed and ease of use.",
  #       url:"https://localstack.cloud/",
  #       upvotes: 10,
  #       downvotes: 20
  #     )
  #   end
  #   # ordered
  #   # popularityx
  #   it 'returns tools ordered ' do
  #     unordered_list = [last, first, third, ]
  #     expect(Tool.index(limit: 4).last to eq(last_tool)
  #     expect(Tool.index(limit: 4, page: 1)). to eq()
  #     expect(Tool.index(limit: 4, page: 1)). to eq()
  #   end
  #
  #   it 'by popularity' do
  #   end
  #
  #
  #
  # end




end
