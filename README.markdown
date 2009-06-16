# Man or Machine 

## Description

Simple component for Adhearsion to distinguish the far end of a phone as being an answering machine or a human, and to take differing actions as a result. Uses Asterisk's built-in AMD() application.

Only really useful for outbound calls, obviously.

## Example

Place this in your dialplan.rb of your Adhearsion project:

    outbound {
      man_or_machine do |call|
        call.man do
          # Executed when a human is at the other end
          ahn_log.agi.info "IT'S A MAN"
        end

        call.machine do
          # Executed when an answering machine is at the other end
          ahn_log.agi.info "IT'S A MACHINE"

          # (Optionally) wait for the answering machine beep to happen before playing sounds
          #wait_for_answering_machine_beep
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
    
## Installation

1. Ensure that your asterisk installation has app_amd.so loaded as a module.

2. In your components directory of your Adhearsion project:

<pre>git clone git://github.com/mtrudel/man_or_machine.git</pre>

3. Add the example code from above to your ~adhearsion-project/dialplan.rb.
