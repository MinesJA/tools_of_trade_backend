require 'rails_helper'

RSpec.describe Tool, :type => :model do

  after(:each) do
    Tool.destroy_all
  end

  before(:each) do
    # User.count = 2
    # Tool.count = 7

    @jon = User.create(
      name: "Jonathan Mines",
      login: "MinesJA",
      avatar_url: "https://avatars2.githubusercontent.com/u/30729672?s=460&v=4"
    )

    @ann = User.create(
      name: "Ann Duong",
      login: "thuyanduong-flatiron",
      avatar_url: "https://avatars3.githubusercontent.com/u/39737217?s=460&v=4"
    )

    @fontPair = @jon.tools.create(
      name: "Font Pair",
      description: "Font Pair is a great tool that lets your pair Google Fonts. It gives you visual examples of font pairings and is very easily navigated and filtered. Definitely worth checking out.",
      url: "https://fontpair.co/"
    )

    @typio = @jon.tools.create(
      name:"Typ.io",
      description:"A really rich and cool font discovery tool. Typ.io boasts more than 2,248 type samples, that have been assembled into a bunch of lists to help you choose fonts for your next project.",
      url:"http://typ.io/"
    )

    @reactSketch = @jon.tools.create(
      name:"React Sketch.app",
      description:"React Sketchapp renders React components to Sketch in real time.",
      url: "http://airbnb.io/react-sketchapp/?ref=stackshare"
    )

    @element = @jon.tools.create(
      name:"Element",
      description:"A Vue 2.0-based desktop UI library, Element was built by the engineers at Ele.me, 'one of the biggest food delivery companies in China.''",
      url: "http://element.eleme.io/#/en-US"
    )

    @feather = @ann.tools.create(
      name:"Feather",
      description:"Feather is a simple open source collection of icons.",
      url:"https://feathericons.com/"
    )

    @hammer = @ann.tools.create(
      name:"Hammer.js",
      description: "Add touch gestures to your webapp.",
      url:"http://hammerjs.github.io/"
    )

    @localStack = @ann.tools.create(
      name:"LocalStack",
      description:"LocalStack is a fully functional local AWS cloud stack by none other than the good folks over at Atlassian. Features include continuous integration, cost-effective testing, and speed and ease of use.",
      url:"https://localstack.cloud/"
    )
  end

  it "is valid with valid attributes" do
    expect(Tool.new(name: "Javascript", description: "A programming language.", url: "www.javascript.com")).to be_valid
  end

  it "is not valid without a name"
  it "is not valid without a description"
  it "is not vlaid without a url"

end
