
jon = User.create(name:"Jon")
bob = User.create(name:"Bob")
sue = User.create(name:"Sue")
carl = User.create(name:"Carl")
charles = User.create(name:"Charles")
jessica = User.create(name:"Jessica")


fontPair = jon.tools.create(name:"Font Pair", description: "Font Pair is a great tool that lets your pair Google Fonts. It gives you visual examples of font pairings and is very easily navigated and filtered. Definitely worth checking out.", url:"https://fontpair.co/", upvotes: 10, downvotes: 5)

typio = jon.tools.create(name:"Typ.io", description:"A really rich and cool font discovery tool. Typ.io boasts more than 2,248 type samples, that have been assembled into a bunch of lists to help you choose fonts for your next project.", url:"http://typ.io/", upvotes: 50, downvotes: 27)

cssGrid = jon.tools.create(name:"CSS Grid Builder", description:"CSS grid is getting a lot of attention and with a good browser support is becoming the standard of grid layout. CSS Grid Builder lets you visually build your grid then copy and paste the generated template string used in your CSS.", url:"https://codepen.io/anthonydugois/full/RpYBmy", upvotes: 77, downvotes: 34)

animasta = bob.tools.create(name:"Animasta", description:"Really cool tool for building feature-rich CSS animations. With tons of options to play with, you will surely and up with the perfect animation to your liking. Simply grab the generated class-based code snippet and paste it into your project. Animista rocks.", url:"http://animista.net/", upvotes: 14, downvotes: 18)

vivify = bob.tools.create(name:"Vivify", description:"If for some reason you are not satisfied with Animista, try Vivify. A very simple yet powerful and straightforward CSS animation generator.", url:"http://vivify.mkcreative.cz/", upvotes: 91, downvotes: 42)

muuri = bob.tools.create(name:"Muuri", description:"Responsive, sortable, filterable and draggable grid layouts. Muuri’s layout system allows positioning the grid items within the container in pretty much any way imaginable. Muuri uses Web Animations to handle all the animations by default. If you need to use Muuri on a browser that does not support Web Animations yet you need to use a polyfill.", url:"https://haltu.github.io/muuri/", upvotes: 17, downvotes: 2)

feather = sue.tools.create(name:"Feather", description:"Feather is a simple open source collection of icons.", url:"https://feathericons.com/", upvotes: 80, downvotes: 72)

hammer = sue.tools.create(name:"Hammer.js", description: "Add touch gestures to your webapp.", url:"http://hammerjs.github.io/", upvotes: 150, downvotes: 15)

amp = sue.tools.create(name:"Amplitude", description:"Since several fellow-students are working on music projects, I thought this tool would be interesting. Amplitude.js is a Modern HTML5 audio player.", url:"https://521dimensions.com/open-source/amplitudejs", upvotes: 63, downvotes: 21)

lottie = sue.tools.create(name:"Lottie", description:"Lottie is an open source mobile library for iOS, Android, and React Native that renders Adobe After Effects animations in real time, allowing apps to use animations as easily as they use static images.", url:"https://airbnb.design/lottie/", upvotes: 42, downvotes: 12)

uppy = jessica.tools.create(name:"Uppy", description:"Uppy is a sleek, open source modular file uploader that integrates with any framework. 'It’s fast, easy to use and lets you worry about more important problems than building a file uploader.'", url:"https://uppy.io", upvotes: 23, downvotes: 0)

localStack = carl.tools.create(name:"LocalStack", description:"LocalStack is a fully functional local AWS cloud stack by none other than the good folks over at Atlassian. Features include continuous integration, cost-effective testing, and speed and ease of use.", url:"https://localstack.cloud/", upvotes: 41, downvotes: 4)

reactSketch = carl.tools.create(name:"React Sketch.app", description:"React Sketchapp renders React components to Sketch in real time.", url: "http://airbnb.io/react-sketchapp/?ref=stackshare", upvotes: 73, downvotes: 21)

element = charles.tools.create(name:"Element", description:"A Vue 2.0-based desktop UI library, Element was built by the engineers at Ele.me, 'one of the biggest food delivery companies in China.''", url: "http://element.eleme.io/#/en-US", upvotes: 150, downvotes: 41)


css = Tag.create(name:"CSS")
frontend = Tag.create(name:"frontend")
grid = Tag.create(name:"grid")
javascript = Tag.create(name:"javascript")
icons = Tag.create(name:"icons")
ruby = Tag.create(name:"ruby")
rubyRails = Tag.create(name:"ruby on rails")
sound = Tag.create(name:"sound")
styling = Tag.create(name:"styling")
fonts = Tag.create(name:"fonts")
animation = Tag.create(name:"animation")
desktop = Tag.create(name:"desktop")
ui = Tag.create(name:"ui")
library = Tag.create(name:"library")
vue = Tag.create(name:"vue")
html5 = Tag.create(name:"html5")
mobile = Tag.create(name:"mobile")
adobe = Tag.create(name:"adobe")
fileuploader = Tag.create(name: "file uploader")


fontPair.tags << fonts
fontPair.tags << frontend

typio.tags << fonts
typio.tags << frontend

cssGrid.tags << css
cssGrid.tags << grid
cssGrid.tags << frontend

animasta.tags << animation
animasta.tags << css
animasta.tags << frontend

vivify.tags << animation
vivify.tags << css

muuri.tags << grid
muuri.tags << css
muuri.tags << frontend
muuri.tags << animation

feather.tags << icons
feather.tags << frontend

hammer.tags << frontend
hammer.tags << animation
hammer.tags << styling

amp.tags << sound
amp.tags << html5

lottie.tags << adobe
lottie.tags << mobile
lottie.tags << animation

uppy.tags << fileuploader

element.tags << library
element.tags << vue
element.tags << desktop
element.tags << ui
