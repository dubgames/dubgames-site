title=Game Loops
date=2014-02-24
type=post
tags=dubbreakout,gamedev,tutorial
category=blog
status=published
~~~~~~

The game loop is an important pattern in game development. The loop will be repeated many times during play. The goal of each pass through the loop is to:

<ol>
<li>Get input from the player -- are they pressing left or right?</li>
<li>Update the position of the player and ball</li>
<li>Draw the player and ball in their new positions</li>
</ol>

In DubBreakout, each pass through the loop happens 60 times every second. Each drawing of the screen is called a frame. Drawing to the screen is called rendering. Since our loop runs 60 times per second we can say the game renders at 60 frames per second (60 fps).

Here is the game loop:

<script src="https://gist.github.com/dubgames/a4921ca6f980e4cef92f.js"></script>
[To see the loop in context see: <a title="Main.cpp" href="https://github.com/dubgames/DubBreakout/blob/master/src/main.cpp">main.cpp</a>]

Here you can see that the loop:

<ol>
<li>Input -- Input_handle()</li>
<li>Update -- Game_update()</li>
<li>Draw -- System_render()</li>
</ol>

We'll get into each of these methods in subsequent posts.

Notice the variable timeDifferenceMillis. This value is calculated in System_startFrame() and is the time passed since the last frame was rendered. Since our game runs at 60fps this value is usually 1000/60 or 16.666... The value is rounded to simply 16. That is 16 milliseconds. A millisecond is one one-thousandth of a second or 1/1000 seconds or 0.001 seconds.

How do we guarantee our loop runs 60 times per second? Well, if it takes 6ms to do the big 3 tasks (input, update, render) then we need to wait 10ms before we start the loop again. This is what happens in System_endFrame(). We calculate the time passed since beginning the loop (timePassed). Then we call SDL_Delay(16ms - timePassed) which will put our loop on hold for the calculated period of time. It's important to calculate the time passed for every frame because some frames will take longer than others to run.

When does the loop end? The loop ends when the user closes the window or presses the Escape key on their keyboard. This is determined by the Input system which will set Input_quit to true.

See Game Programming Patterns on the <a title="Game Loop" href="http://gameprogrammingpatterns.com/game-loop.html">Game Loop</a> for another description.

Questions or Suggestions? Feel free to leave a maessage below or send me a direct message: gram [at] dubgames.com