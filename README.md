### What is this thing?

I'm glad you asked my deer nvim nerd. This is just a simple plugin that allows you to change colour of the cursor, backgroudn (numbers on the side) and some other accents based on the mode that you are currently in.

### Why it even exists

I know what you are thinking - "why would I even want this, isn't this distracting instead of helpful?". Answear to wrapped question - If you're goofBall and set all colours to be more saturated than sun itself then it's pretty bad. But if you choose nice colours then it's nice.
And the answear to the quiestion after unwrapping it - you may want this if you use anything that has occasional latency that put's you in a state in which it's not obvious in which mode you are. It also looks cool.

## Installation

The same way as every other plugin. I use Lazy and there you would just add this line to you config

```
       "kosior3kt/mode-colors.nvim"
```

that's it. no dependencies or anything.
oh, obsiously in order to use it you need to call require("mode-colors").setup({}) somewhere


## Customization

just pass object of this signature into a setup function:

```
{
    cursor = 
   {
      i = plugin.COLOR_CONSTANTS.green,                 --- <-- COLOR_CONSTANTS is a preprepared colours that I occasionaly use. i is the name of the mode that we try to address. More on that later
   },
   background = 
   {
      
   },
   column_marker = 
   {

   },       --- <--- learn JS devs...
}
```

in general it should be looking something like this:

```
    require("modal-color").setup
    ({
           cursor = 
           {
              i = plugin.COLOR_CONSTANTS.green,         --- <-- COLOR_CONSTANTS is a preprepared colours that I occasionaly use
           },
           background = 
           {
              i = "#696969",                            --- <-- you can pass your colours directly here
           },
           column_marker = 
           {

           },
    })
```

# List of available modes
    n   - normal
    i   - insert
    v   - visual
    c   - command line
    o   - Operator-pending
    tl  - terminal
rest of them are either variation or something weird if you are aware of them and understand them create PR or sth
* V 
* no
* s 
* ic
* r 
* rv
* cv
* ce
* rm
* tr

# List of available colours
```
    + yellow          = "#ECBE7B"
    + cyan            = "#008080"
    + darkblue        = "#292E42"
    + green           = "#3D5122"
    + orange          = "#A16F27"
    + violet          = "#A9A1E1"
    + magenta         = "#C678DD"
    + blue            = "#AA7799"
    + red             = "#6F3328"
```
  
    I mean obviously you can just pass your own colours instead...

# Colum Marker
Tbh I have no clue why people even use this thing... But I use, so I might include it here as well

```
{
    cursor = 
   {
   },
   background = 
   {
   },
   column_marker = 
   {
        use = true,                         --- go figure...
        number = 112,                       --- on which column (counting from left this thing will show up)
        colour = COLOR_CONSTANTS.magenta,   --- the colour of it
   },
}
```


