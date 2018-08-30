
User.destroy_all
Tool.destroy_all
UserTool.destroy_all
Tag.destroy_all
TagTool.destroy_all

jon = User.create(
  name: "Jonathan Mines",
  login: "MinesJA",
  avatar_url: "https://avatars2.githubusercontent.com/u/30729672?s=460&v=4")

meryl = User.create(
  name: "Meryl Dakin",
  login: "meryldakin",
  avatar_url: "https://avatars2.githubusercontent.com/u/24256463?s=460&v=4")

ann = User.create(
  name: "Ann Duong",
  login: "thuyanduong-flatiron",
  avatar_url: "https://avatars3.githubusercontent.com/u/39737217?s=460&v=4")

tim = User.create(
  name: "Timothy Levi Campbell",
  login: "rrcobb",
  avatar_url: "https://avatars2.githubusercontent.com/u/3818920?s=460&v=4")

rob = User.create(
  name: "Robert W Cobb",
  login: "MinesJA",
  avatar_url: "https://avatars2.githubusercontent.com/u/30729672?s=460&v=4")

alex = User.create(
  name: "Alex Griffith",
  login: "alexgriff",
  avatar_url: "https://avatars1.githubusercontent.com/u/12286943?s=460&v=4")

puts "Created #{User.count} users."

# _____________________
# Post Tools
# _____________________

fontPair = jon.post_tool(
  name:"Font Pair",
  description: "Font Pair is a great tool that lets your pair Google Fonts. It gives you visual examples of font pairings and is very easily navigated and filtered. Definitely worth checking out.",
  url:"https://fontpair.co/",
  tag_strings: ["fonts", "frontend"])

typio = jon.post_tool(
  name:"Typ.io",
  description:"A really rich and cool font discovery tool. Typ.io boasts more than 2,248 type samples, that have been assembled into a bunch of lists to help you choose fonts for your next project.",
  url:"http://typ.io/",
  tag_strings: ["fonts", "frontend"])

cssGrid = jon.post_tool(
  name:"CSS Grid Builder",
  description:"CSS grid is getting a lot of attention and with a good browser support is becoming the standard of grid layout. CSS Grid Builder lets you visually build your grid then copy and paste the generated template string used in your CSS.",
  url:"https://codepen.io/anthonydugois/full/RpYBmy",
  tag_strings: ["css", "grid", "frontend"])

animasta = meryl.post_tool(
  name:"Animasta",
  description:"Really cool tool for building feature-rich CSS animations. With tons of options to play with, you will surely and up with the perfect animation to your liking. Simply grab the generated class-based code snippet and paste it into your project. Animista rocks.",
  url:"http://animista.net/",
  tag_strings: ["animation", "css", "frontend"])

vivify = meryl.post_tool(
  name:"Vivify",
  description:"If for some reason you are not satisfied with Animista, try Vivify. A very simple yet powerful and straightforward CSS animation generator.",
  url:"http://vivify.mkcreative.cz/",
  tag_strings: ["css", "animation"])

muuri = meryl.post_tool(
  name:"Muuri",
  description:"Responsive, sortable, filterable and draggable grid layouts. Muuri’s layout system allows positioning the grid items within the container in pretty much any way imaginable. Muuri uses Web Animations to handle all the animations by default. If you need to use Muuri on a browser that does not support Web Animations yet you need to use a polyfill.",
  url:"https://haltu.github.io/muuri/",
  tag_strings: ["grid", "css", "frontend", "animation"])

feather = ann.post_tool(
  name:"Feather",
  description:"Feather is a simple open source collection of icons.",
  url:"https://feathericons.com/",
  tag_strings: ["icons", "frontend"])

hammer = ann.post_tool(
  name:"Hammer.js",
  description: "Add touch gestures to your webapp.",
  url:"http://hammerjs.github.io/",
  tag_strings: ["frontend", "animation", "styling"])

amp = ann.post_tool(
  name:"Amplitude",
  description:"Since several fellow-students are working on music projects, I thought this tool would be interesting. Amplitude.js is a Modern HTML5 audio player.",
  url:"https://521dimensions.com/open-source/amplitudejs",
  tag_strings: ["sound", "html5"])

lottie = ann.post_tool(
  name:"Lottie",
  description:"Lottie is an open source mobile library for iOS, Android, and React Native that renders Adobe After Effects animations in real time, allowing apps to use animations as easily as they use static images.",
  url:"https://airbnb.design/lottie/",
  tag_strings: ["adobe", "mobile", "animation"])

uppy = tim.post_tool(
  name:"Uppy",
  description:"Uppy is a sleek, open source modular file uploader that integrates with any framework. 'It’s fast, easy to use and lets you worry about more important problems than building a file uploader.'",
  url:"https://uppy.io",
  tag_strings: ["fileuploader"])

localStack = rob.post_tool(
  name:"LocalStack",
  description:"LocalStack is a fully functional local AWS cloud stack by none other than the good folks over at Atlassian. Features include continuous integration, cost-effective testing, and speed and ease of use.",
  url:"https://localstack.cloud/",
  tag_strings: ["cloud", "testing"])

reactSketch = rob.post_tool(
  name:"React Sketch.app",
  description:"React Sketchapp renders React components to Sketch in real time.",
  url: "http://airbnb.io/react-sketchapp/?ref=stackshare",
  tag_strings: ["sketch", "design"])

element = alex.post_tool(
  name:"Element",
  description:"A Vue 2.0-based desktop UI library, Element was built by the engineers at Ele.me, 'one of the biggest food delivery companies in China.''",
  url: "http://element.eleme.io/#/en-US",
  tag_strings: ["library", "vue", "desktop", "ui"])

puts "Created #{Tool.count} tools."
puts "Created #{Tag.count} tags."


# _____________________
# Save Tools
# _____________________

jon.save_tool(tool_id: animasta.id)
jon.save_tool(tool_id: vivify.id)
jon.save_tool(tool_id: muuri.id)
meryl.save_tool(tool_id: feather.id)
meryl.save_tool(tool_id: hammer.id)
meryl.save_tool(tool_id: amp.id)
meryl.save_tool(tool_id: typio.id)
meryl.save_tool(tool_id: cssGrid.id)
ann.save_tool(tool_id: typio.id)
ann.save_tool(tool_id: animasta.id)
ann.save_tool(tool_id: muuri.id)
ann.save_tool(tool_id: uppy.id)
ann.save_tool(tool_id: element.id)
ann.save_tool(tool_id: reactSketch.id)

puts "Saved #{UserTool.count} tools."
