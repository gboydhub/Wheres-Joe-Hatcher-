# Where's Joe Hatcher?
### A Ruby Mystery Adventure


## Design Document
Setting: "The Office"
Story: [REDACTED]

#### Rooms
Entrance
Verbs: Go/Walk
Exits: Up (steps), Down[blocked] (steps), to elevator[north]

Elevator [1f/3f]
Verbs: Push, Look, Use
Exits: Door/East, Door/South
Objects: Button 1..4, panel

Stairwell [2f/3f/4f]
Verbs: Go/Walk, Open, Use
Exits: Up/Down (steps) [1f is Entrance]
Objects: Door

Hall South
Verbs: Walk/Go to, use
Exits: Carpet Room/Door, Elevator/West, Stairwell [3f]/South, Hall/North
Objects: Door, Elevator

Hall North
Verbs: Walk/Go to
Exits: Office/East, Bathroom/West, Hall/South

Carpet Room
Verbs: Walk/Go to, look at
Exits: Hall/East
Objects: Window, Piece of Paper/Paper

Washroom
Verbs: Walk/Go to, look at/through, use
Exits: Hall, [REDACTED]
Objects: Mirror, Sink, Windows

Office Commons
Verbs: Walk/Go to, open, look at, sit in, use
Exits: Hall, North, South(locked)
Objects: Fridge, Snacks, Massage Chairs/Chair, Windows

Office North
Verbs: Walk/Go, Look at, Use
Exits: South
Objects: Desks, Laptops, Windows