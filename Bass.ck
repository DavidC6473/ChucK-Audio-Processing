// David Clarke - 121125392

fun void bass() {
    Mandolin bass => PRCRev r => dac;     // reverbed mandolin bass

    // parameter setup 
    0.05 => r.mix;
    0.2 => bass.bodySize; 
    0.8 => bass.pluckPos;
    0.5 => bass.stringDamping;
    0.5 => bass.gain;

    // C Major Pentatonic scale through 2 octaves
    [48,50,52,55,57,60,62,64,67,69,72] @=> int scale[]; 
    4 => int walkPos;          // scale position

    while(true)
    {
        // traverses through scale by -1, 0 or 1
        Math.random2(-1,1) +=> walkPos;          
        
        // stays within array
        if (walkPos < 0) 1 => walkPos;           
        if (walkPos >= scale.cap()) scale.cap()-2 => walkPos;
        
        // use scale note
        Std.mtof(scale[walkPos]-24) => bass.freq;
        
        //play note for .95 seconds
        1 => bass.noteOn;
        0.95 :: second => now;
        
        // note off for .05 seconds
        1 => bass.noteOff;
        
        0.05 :: second => now;
    }
}

spork ~ bass();
300.0 :: second => now;