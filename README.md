wordreference-cli
===================

Simple wordreference CLI

Clone this repository and install the package:

    git clone git@github.com:pilu/wordreference-cli.git

    cd wordreference-cli

Compile the coffeescript sources:

    coffee -o lib -c src/

Install the package:

    npm install -g .

In your profile file export your wordreference.com API KEY:

    export WORDREFERENCE_API_KEY=YOUR_API_KEY

If you usually use the same dictionary, create a function like this in your profile file:

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
