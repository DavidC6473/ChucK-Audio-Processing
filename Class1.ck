// David Clarke - 121125392

// create class
public class Class1
{
    // send impulse to biquad to envelope
    Impulse imp => BiQuad bq => Envelope env;
    
    // filter gain
    .1 => bq.gain;
    // equal gain zeros
    1 => bq.eqzs;
    // pole radius
    .85 => bq.prad;
    // envelope
    2.0::second => env.duration;

    // pole radius function
    fun void radius( float rad )
    { rad => bq.prad; }
    
    // gain function
    fun void gain( float g )
    { g => imp.gain; }

    // envelope function
    fun void connect( UGen ugen )
    { env => ugen; }

    // trigger function
    fun void trigger( float freq )
    {
        // sets current impulse
        1.0 => imp.next;
        // resonant frequency set for filter
        freq => bq.pfreq;
        // envelope on
        env.keyOn();
    }

    // trigger function using midi to frequency
    fun void trigger( int note )
    { trigger( Std.mtof( note ) ); }

    // function to close envelope
    fun void close() { env.keyOff(); }
}

// Class1 called as impulse
Class1 impulse;

fun void impul() {
    // connect gain reverb and echo
    Gain g => PRCRev r => Echo e => dac;
    // send gain rev and echo to dac
    g => dac;
    e => dac.right;
    r => dac.left;

    // set delay rev and gain parameters
    2::second => e.max => e.delay;
    1 => g.gain;
    .6 => e.gain;
    .3 => r.mix;

    // connect Class1
    impulse.connect( g );
    // radius less than 1
    impulse.radius( .999 );

    // C Major Scale
    [ 14,16,19,21,24,26,28,31,33,36 ] @=> int hi[];

    // infinite while loop
    while( true )
    {
        // trigger
        45 + Math.random2(0,3) * 12 + 
             hi[Math.random2(0,hi.size()-1)] => impulse.trigger;
        450::ms => now;
        // close envelope
        impulse.close();
        50::ms => now;
    }
}

spork ~ impul();
300.0 :: second => now;