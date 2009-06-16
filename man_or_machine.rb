class AMDHandler
  attr_accessor :handlers

  def initialize
    @handlers = {}
  end

  def man(&block)
    raise Error, "Must supply a block!" unless block_given?
    @handlers['HUMAN'] = block
  end 

  def machine(&block)
    raise Error, "Must supply a block!" unless block_given?
    @handlers['MACHINE'] = block
  end 

  def notsure(&block)
    raise Error, "Must supply a block!" unless block_given?
    @handlers['NOTSURE'] = block
  end 

  def hangup(&block)
    raise Error, "Must supply a block!" unless block_given?
    @handlers['HANGUP'] = block
  end 
end

methods_for :dialplan do
  def man_or_machine(args = nil, &block)
    handler = AMDHandler.new
    yield handler
    execute("AMD") # TODO -- plumb args into here for AMD tweaks
    chosen_handler = handler.handlers[get_variable("AMDSTATUS")]
    chosen_handler.call unless chosen_handler.nil?
  end

  def wait_for_answering_machine_beep
    execute("WaitForSilence")
    execute("WaitForSilence")
  end
end
