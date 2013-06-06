wordreference-cli
===================

Simple wordreference CLI

Clone this repository and install the package:

    git clone git@github.com:pilu/wordreference-cli.git

    cd wordreference-cli

    npm install -g .

In your profile file export your wordreference.com API KEY:

    export WORDREFERENCE_API_KEY=YOUR_API_KEY

If you usually use a dictionary, create a function like this in your profile file:

    function wr  { wordreference enit $1 | less;  }

Now from your terminal run:

    wr hello

You should see something like this:

    HELLO (enit)

    hello [interj] (greeting)
        salve, buongiorno, buonasera [interiez]
        ciao [interiez] (informale)

    hello [n] (greeting, utterance of hello)
        ciao, salve [inter]

    hello [n] (a greeting)
        saluto [nm]

    © WordReference.com
    (END)
