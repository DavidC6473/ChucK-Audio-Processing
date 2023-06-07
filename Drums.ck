// David Clarke - 121125392

Gain master[3];          
master[0] => dac.left;   // left to dac.left
master[1] => dac;        // center to dc left and right
master[2] => dac.right;  // right to dac.right

// send samples to left, center or right
SndBuf kick => master[1];
SndBuf snare => master[1];
SndBuf hihat => master[2];
SndBuf cowbell => master[1];
SndBuf tom => master[0];


// load drum sample files
me.dir()+"/audio/kick - juno.wav" => kick.read;
me.dir()+"/audio/Snare - Tapestop.wav" => snare.read;
me.dir()+"/audio/Hats - Sweet.wav" => hihat.read;
me.dir()+"/audio/tom-fm.wav" => cowbell.read;
me.dir()+"/audio/Clap - Giannis.wav" => tom.read;


// Array to control hat strikes.
[1,1,1,0, 1,1,1,0, 1,1,1,0, 1,1,1,0] @=> int hiHits[];

// set measure length
hiHits.cap() => int MAX_BEAT; 

// modulo number for controlling drums
4 => int MOD;

// tempo controller
0.25 :: second => dur tempo; 

// count beats and measures
0 => int beat;    
0 => int measure; 

// create int to count time
0 => int j;

// drums play for set length
while (j < 1236)
{
    // plays kick (0, 8, ...)
    if (beat % 8 == 0)     // use MOD to play kick on every 8th beat
    {                 
        0.8 => kick.gain;
        0 => kick.pos;
    }
    if (beat % 16 == 1)     // add double kick
    {   
        0.6 => kick.gain;
        0 => kick.pos;
    }
    if (beat % 16 == 6)     // add extra kick
    {   
        0.5 => kick.gain;
        0 => kick.pos;
    }
    
    // plays snare (4, 12, ...)
    if (beat % 8 == 4)    // use MOD to play snare on every 8th beat
    {
        0 => snare.pos;
    }
    
    // plays tom (4, 12, ...)
    if (beat % 8 == 4)    // use MOD to play tom on every 8th beat
    {
        0 => tom.pos;
    }
    
    // plays hats (0, 2, ...)
    if (beat % 2 == 0)    // use MOD to play tom on every 2nd beat
    {
        Math.random2f(0.2,1.0) => hihat.gain;  // hats have random gain
        0 => hihat.pos;
    }
    
    // plays cowbell (0, 16, ...)
    if (beat % 16 == 0)     // use MOD to play cowbell on every 16th beat
    {
        Math.random2f(0.4,0.7) => cowbell.gain;  // cowbell has random gain
        0 => cowbell.pos;
    }
        
    1 +=> j;                    // j increases by 1 every .25 seconds
    tempo => now;               // wait for one beat
        
    (beat + 1) % MAX_BEAT => beat; // update beat counter
    if (beat==0)
    {            // increments measure counter for each new measure
        measure++;  
    }
}
