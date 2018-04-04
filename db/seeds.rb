# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# create_table "tag_tools", force: :cascade do |t|
#   t.integer "tag_id"
#   t.integer "tool_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
#
# create_table "tags", force: :cascade do |t|
#   t.string "name"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
#
# create_table "tools", force: :cascade do |t|
#   t.string "name"
#   t.text "description"
#   t.string "url"
#   t.integer "upvotes"
#   t.integer "downvotes"
#   t.integer "user_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
#
# create_table "users", force: :cascade do |t|
#   t.string "name"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end


jon = User.create(name:"Jon")
bob = User.create(name:"Bob")
sue = User.create(name:"Sue")


fontPair = jon.tools.create(name:"Font Pair", description: "Font Pair is a great tool that lets your pair Google Fonts. It gives you visual examples of font pairings and is very easily navigated and filtered. Definitely worth checking out.", url:"https://fontpair.co/")

typio = jon.tools.create(name:"Typ.io", description:"A really rich and cool font discovery tool. Typ.io boasts more than 2,248 type samples, that have bee assembled into a bunch of lists to help you choose fonts for your next project.", url:"http://typ.io/")

cssGrid = jon.tools.create(name:"CSS Grid Builder", description:"CSS grid is getting a lot of attention and with a good browser support is becoming the standard of grid layout. CSS Grid Builder lets you visually build your grid then copy and paste the generated template string used in your CSS.", url:"https://codepen.io/anthonydugois/full/RpYBmy")

animasta = bob.tools.create(name:"Animasta", description:"Really cool tool for building feature-rich CSS animations. With tons of options to play with, you will surely and up with the perfect animation to your liking. Simply grab the generated class-based code snippet and paste it into your project. Animista rocks.", url:"http://animista.net/")

vivify = bob.tools.create(name:"Vivify", description:"If for some reason you are not satisfied with Animista, try Vivify. A very simple yet powerful and straightforward CSS animation generator.", url:"http://vivify.mkcreative.cz/")

muuri = bob.tools.create(name:"Muuri", description:"Responsive, sortable, filterable and draggable grid layouts. Muuri’s layout system allows positioning the grid items within the container in pretty much any way imaginable. Muuri uses Web Animations to handle all the animations by default. If you need to use Muuri on a browser that does not support Web Animations yet you need to use a polyfill.", url:"https://haltu.github.io/muuri/")

feather = sue.tools.create(name:"Feather", description:"Feather is a simple open source collection of icons.", url:"https://feathericons.com/")

hammer = sue.tools.create(name:"Hammer.js", description: "Add touch gestures to your webapp.", url:"http://hammerjs.github.io/")

amp = sue.tools.create(name:"Amplitude", description:"Since several fellow-students are working on music projects, I thought this tool would be interesting. Amplitude.js is a Modern HTML5 audio player.", url:"https://521dimensions.com/open-source/amplitudejs")

css = Tag.create(name:"CSS")
javascript = Tag.create(name:"javascript")
ruby = Tag.create(name:"ruby")
rubyRails = Tag.create(name:"ruby on rails")
sound = Tag.create(name:"sound")
styling = Tag.create(name:"styling")
fonts = Tag.create(name:"fonts")
animation = Tag.create(name:"animation")




#
