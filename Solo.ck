// David Clarke - 121125392

Rhodey solo => JCRev rev => dac;    // reverbed rhodey piano
0.4 => rev.mix;
solo => Delay d => d => rev;       // add delay

// parameter setup
0.8 :: second => d.max => d.delay;  
0.5 => d.gain;
0.4 => solo.gain;

// C Major Pentatonic scale through 2 octaves
[36,38,40,43,45,48,50,52,55,57,60] @=> int scale[]; // (4) Jazz scale array.

// create float to count time
0 => float j;

// plays while j is less than 120
while (j < 130.0) {           
    // randomly plays note every .2, .4 .6 .8 1 seconds                 
    (Math.random2(0,5) * 0.2) :: second => now;
    
    // picks new on ocasion
    if (Math.random2(0,5) > 1) {
        // selects note
        Math.random2(0,scale.cap()-1) => int note; 
        // applies note
        Math.mtof(12+scale[note])=> solo.freq;
        Math.random2f(0.3,1.0) => solo.noteOn;
        // increase j
        0.5 +=> j;
    }
    
    // note stays the same
    else 1 => solo.noteOff;      
}
