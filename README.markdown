h1. Man or Machine 

h2. Description

Simple component for Adhearsion to distinguish the far end of a phone as being an answering machine or a human, and to take differing actions as a result. Uses Asterisk's built-in AMD() application.

Only really useful for outbound calls, obviously.

h2. Example

Place this in your dialplan.rb of your Adhearsion project:

    <pre>
	<code>
	outbound {
    man_or_machine do |call|
        call.man do
          # Executed when a human is at the other end
          ahn_log.agi.info "IT'S A MAN"
        end

        call.machine do
          # Executed when an answering machine is at the other end
          ahn_log.agi.info "IT'S A MACHINE"
        end

        call.notsure do
          # Executed when we can't tell what's at the other end
          ahn_log.agi.info "WHO KNOWS"
        end

        call.hangup do
          # Executed if the remote end hung up while we were trying to determine 
          ahn_log.agi.info "HANGUP"
        end
      end
    }
	</code>
	</pre>
		
h2. Installation

1. Ensure that your asterisk installation has app_amd.so loaded as a module.

2. In your components directory of your Adhearsion project:

<pre>git clone git://github.com/mtrudel/man_or_machine.git</pre>

3. Then add the example code from above to your ~adhearsion-project/dialplan.rb.

Then you're off and running!
